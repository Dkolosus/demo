import json
import time
import pika
import paramiko
import requests
import pika.exceptions
from datetime import datetime
import warnings
import configparser

def conf_pars():
    config = configparser.ConfigParser()
    config.read("rabbitmq-diag.conf")
    return config

def create_rabbitmq_connection(user, pswd, host, port, vhost):
    credentials = pika.PlainCredentials(user, pswd)
    parameters = pika.ConnectionParameters(host, port, vhost, credentials )
    connection = pika.BlockingConnection(parameters)
    return connection

def create_rabbitmq_queue(connection, queue_name):
    channel = connection.channel()
    channel.queue_declare(queue=queue_name, durable=True, arguments={"x-queue-type": "quorum"})

def send_rabbitmq_message(channel, queue_name, message_text):
    channel.basic_publish(exchange='', routing_key=queue_name, body=message_text)
    print(f'Message send to queue {queue_name}')

def get_rabbitmq_message_basic(channel,queue_name):
    method_frame, header_frame, body = channel.basic_get(queue_name)
    if method_frame:
        print(f'Message is  ----- {body}')
        channel.basic_ack(method_frame.delivery_tag)
    else:
        print('No message returned')

def get_ssh_client(host, username, key_file):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(hostname=host, username=username, key_filename=key_file)
    return client

def exec_ssh_cmd(client, cmd):
    stdin, stdout, stderr = client.exec_command(cmd)
    result = str(stdout.read())
    result = result.split("\\n")
    return result

def get_http_request(user, pswd, host, vhost, queue_name):
    req_ans = requests.get(f'https://{host}:15671/api/queues/{vhost}/{queue_name}',
                           auth=(user, pswd) , verify=False)
    req_ans.raise_for_status()
    data = req_ans.json()
    return data.get('leader')

def do_job():
    config = conf_pars()
    print('')
    print('********************')
    print('')
    print(f'Start test for rabbitmq cluster {config["rbmq"]["rabbitmq_host"]}')
    warnings.filterwarnings("ignore")
    bknd_node = ''
    nft_queue_leader = ''
    timestamp = time.time()
    conv_date = datetime.fromtimestamp(timestamp)
    message_text = f'Its a fucking message to fucking queue  {conv_date}'
    rbmq_dict = json.loads(config["rbmq"]["rabbitmq_node_dict"])
    queue_leader = get_http_request(config["rbmq"]["rabbitmq_user"], config["rbmq"]["rabbitmq_password"],
                                    config["rbmq"]["rabbitmq_host"], config["rbmq"]["rabbitmq_vhost"],
                                    config["rbmq"]["rabbitmq_queue_name"])
    for key, value in rbmq_dict.items():
        if key in queue_leader:
            bknd_node = value
            nft_queue_leader = key
            print('')
            print(f'Queue quorum leader {nft_queue_leader}')
            print(f'Queue quorum leader node {bknd_node}')
            print('')
            break
    nft_add_chain = f"sudo nft 'add chain inet Firewall INPUT {{ type filter hook input priority -50; policy accept; }}'"
    nft_cmd_icmp_drop = f"sudo nft 'add rule inet Firewall INPUT ip daddr {nft_queue_leader} icmp type {{ echo-request, echo-reply }} drop'"
    nft_cmd_drop_dport = f"sudo nft 'add rule inet Firewall INPUT ip daddr {nft_queue_leader} tcp dport 1-65535 drop'"
    nft_cmd_drop_sport = f"sudo nft 'add rule inet Firewall INPUT ip saddr {nft_queue_leader} tcp sport 1-65535 drop'"
    nft_flush_chain = f"sudo nft 'flush chain inet Firewall INPUT'"
    nft_delete_chain = f"sudo nft 'delete chain inet Firewall INPUT'"
    rbmq1_connection = create_rabbitmq_connection(config["rbmq"]["rabbitmq_user"], config["rbmq"]["rabbitmq_password"],
                                                  config["rbmq"]["rabbitmq_host"], config["rbmq"]["rabbitmq_amqp_port"],
                                                  config["rbmq"]["rabbitmq_vhost"])
    rbmq_channel = rbmq1_connection.channel()
    print(f'Sending a message to {config["rbmq"]["rabbitmq_queue_name"]} queue')
    send_rabbitmq_message(rbmq_channel, config["rbmq"]["rabbitmq_queue_name"], message_text)
    rbmq1_connection.close()
    print('')
    print(f"Add nftables rules to {bknd_node}")
    print('')
    ssh_client = get_ssh_client( bknd_node, config["rbmq"]["ssh_user"], config["rbmq"]["ssh_key_path"])
    ssh_resp = exec_ssh_cmd(ssh_client, nft_add_chain)
    ssh_resp = exec_ssh_cmd(ssh_client, nft_cmd_icmp_drop)
    ssh_resp = exec_ssh_cmd(ssh_client, nft_cmd_drop_dport)
    ssh_resp = exec_ssh_cmd(ssh_client, nft_cmd_drop_sport)
    ssh_client.close()
    print(f"Pause for 20 sec wait until haproxy will remove {nft_queue_leader} from pool")
    time.sleep(20)
    print('')
    print("Try to get message")
    print('')
    try:
        rbmq2_connection = create_rabbitmq_connection(config["rbmq"]["rabbitmq_user"], config["rbmq"]["rabbitmq_password"],
                                                      config["rbmq"]["rabbitmq_host"], config["rbmq"]["rabbitmq_amqp_port"], config["rbmq"]["rabbitmq_vhost"])
        rbmq_channel = rbmq2_connection.channel()
        get_rabbitmq_message_basic(rbmq_channel, config["rbmq"]["rabbitmq_queue_name"])
        rbmq2_connection.close()
    except Exception as rbmq_error:
        print(rbmq_error)
        try:
            rbmq2_connection = create_rabbitmq_connection(config["rbmq"]["rabbitmq_user"], config["rbmq"]["rabbitmq_password"],
                                                          config["rbmq"]["rabbitmq_host"], config["rbmq"]["rabbitmq_amqp_port"], config["rbmq"]["rabbitmq_vhost"])
            rbmq_channel = rbmq2_connection.channel()
            get_rabbitmq_message_basic(rbmq_channel, config["rbmq"]["rabbitmq_queue_name"])
            rbmq2_connection.close()
        except Exception as rbmq_error:
            print(rbmq_error)
    print('')
    print(f"Pause for 60 sec, wait until the {nft_queue_leader} has been removed from the cluster")
    print('')
    time.sleep(60)
    print(f"Delete nftables rules from {bknd_node}")
    ssh_client = get_ssh_client(bknd_node, config["rbmq"]["ssh_user"], config["rbmq"]["ssh_key_path"])
    ssh_resp = exec_ssh_cmd(ssh_client, nft_flush_chain )
    ssh_resp = exec_ssh_cmd(ssh_client, nft_delete_chain)
    ssh_client.close()
    print('')
    print(f'Test {config["rbmq"]["rabbitmq_host"]} complete')

if __name__ == "__main__":
    do_job()