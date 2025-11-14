import paramiko
import re
import psycopg2
import configparser


# Создаём клиента ssh
def get_ssh_client(ip, port, username, password):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(ip, port=port, username=username, password=password)
    return client


def request_ssh_data(client, cmd):
    stdin, stdout, stderr = client.exec_command(cmd)
    result = str(stdout.read())
    result = result.split("\\n")
    return result


def remove_g(lst, command):
    lst_g = []
    if command == 'iptables':
        for i in range(len(lst)):
            match = re.fullmatch(r':.{0,}', lst[i])
            match_b = re.fullmatch(r'.{0,}#.{0,}', lst[i])
            match_c = re.fullmatch(r'COMMIT', lst[i])
            match_k = re.fullmatch(r'\'', lst[i])
            if not match and not match_b and not match_c and not match_k:
                lst_g.append(lst[i])
        lst = lst_g
    if command == 'route':
        for i in range(len(lst)):
            match = re.search(r'b\'', lst[i])
            if match:
                lst[i] = lst[i].replace('b', '', 1)
            match = re.search(r'\'', lst[i])
            if match:
                lst[i] = lst[i].replace("\'", "", 1)
    return lst


def conf_pars():
    config = configparser.ConfigParser()
    config.read("config.ini")
    return config


def create_sql_con():
    config = conf_pars()
    conn = psycopg2.connect(dbname=config["db"]["dbname"], user=config["db"]["dbuser"], password=config["db"]["dbpassword"], host=config["db"]["dbhost"])
    return conn


def get_conf_servers():
    query = "SELECT ip_address,username,password,port FROM config_servers"
    conn = create_sql_con()
    cursor = conn.cursor()
    cursor.execute(query)
    res = cursor.fetchall()
    cursor.close()
    conn.close()
    return res


def sql_query(query):
    conn = create_sql_con()
    cursor = conn.cursor()
    cursor.execute(query)
    res = cursor.fetchall()
    cursor.close()
    conn.close()
    return res


def get_route(ip):
    lst = []
    config = get_conf_servers()
    for row in config:
        client = get_ssh_client(f'{row[0]}', f'{row[3]}', f'{row[1]}', f'{row[2]}')
        hostname = request_ssh_data(client, f'hostname')
        hostname = remove_g(hostname, 'route')
        route = request_ssh_data(client, f'ip route get {ip}')
        route = remove_g(route, 'route')
        client.close()
        for r in route:
            match = re.search(r'cache', r)
            size = len(r)
            if not match and size > 1:
                lst.append(f'{hostname[0]} {r}')
    return lst


def search_router(ip_src='0', ip_dst='0'):
    regex_template = "[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}"
    conf_serv = get_conf_servers()
    src_router = '0'
    dst_router = '0'
    routers = []
    lst_src_route = []
    lst_dst_route = []
    if ip_src != '0':
        lst_src_route = get_route(ip_src)
    if ip_dst != '0':
        lst_dst_route = get_route(ip_dst)
    if len(lst_src_route) > 0:
        for row in lst_src_route:
            row = row.split()
            if row[3]:
                router_src = re.fullmatch(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', row[3])
                if router_src:
                    for servers in conf_serv:
                        ssh_client = get_ssh_client(servers[0], servers[3], servers[1], servers[2])
                        res_if = request_ssh_data(ssh_client, 'ls /sys/class/net')
                        res_if = remove_g(res_if, 'route')
                        for iface in res_if:
                            if len(iface) > 0:
                                res_if_ip = request_ssh_data(ssh_client, f"ip a show {iface} | egrep -o '{regex_template}'")
                                res_if_ip = remove_g(res_if_ip, 'route')
                                for ip in res_if_ip:
                                    if ip == row[3]:
                                        src_router = servers[0]
                        ssh_client.close()
                        if src_router != '0':
                            break
    if len(lst_dst_route) > 0:
        for row in lst_dst_route:
            row = row.split()
            if row[3]:
                router_dst = re.fullmatch(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', row[3])
                if router_dst:
                    for servers in conf_serv:
                        ssh_client = get_ssh_client(servers[0], servers[3], servers[1], servers[2])
                        res_if = request_ssh_data(ssh_client, 'ls /sys/class/net')
                        res_if = remove_g(res_if, 'route')
                        for iface in res_if:
                            if len(iface) > 0:
                                res_if_ip = request_ssh_data(ssh_client, f"ip a show {iface} | egrep -o '{regex_template}'")
                                res_if_ip = remove_g(res_if_ip, 'route')
                                for ip in res_if_ip:
                                    if ip == row[3]:
                                        dst_router = servers[0]
                        ssh_client.close()
                        if dst_router != '0':
                            break

    if src_router != '0':
        routers.append(src_router)
    if dst_router != '0':
        routers.append(dst_router)
    return routers


def do_job():
    lst = search_router('192.168.100.55', '10.16.201.5')
    if len(lst) > 0:
        if lst[0]:
            hostname_src = sql_query(f"SELECT description from config_servers where config_servers.ip_address='{lst[0]}'")
            print(f'Source router ----- {hostname_src[0][0]} {lst[0]}')
        if lst[1]:
            hostname_dst = sql_query(f"SELECT description from config_servers where config_servers.ip_address='{lst[1]}'")
            print(f'Destination router ----- {hostname_dst[0][0]} {lst[1]}')


if __name__ == '__main__':
    do_job()
