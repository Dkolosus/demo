import multiprocessing
import paramiko
import re
import psycopg2
import configparser
from datetime import datetime


# Определяем пул ядер CPU выполняем метод
def multi_cpu(proccess_func, data):
    pool = multiprocessing.Pool()
    result = pool.map(proccess_func, data)
    return result


# Создаём клиента ssh
def get_ssh_client(ip, port, username, password):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(ip, port=port, username=username, password=password)
    return client


# Выполнение команды по ssh
def request_ssh_data(client, cmd):
    stdin, stdout, stderr = client.exec_command(cmd)
    result = str(stdout.read())
    result = result.split("\\n")
    return result


# Очистка  списка от не нужных символов (строк) вывода полученного от выполнения ssh команды
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


# Получение данных для подключения к базе postgresql из конфиг файла
def conf_pars():
    config = configparser.ConfigParser()
    config.read("config.ini")
    return config


# Создание подключения к базе postgresql
def create_sql_con():
    config = conf_pars()
    conn = psycopg2.connect(dbname=config["db"]["dbname"], user=config["db"]["dbuser"], password=config["db"]["dbpassword"], host=config["db"]["dbhost"])
    return conn


# Получения данных для подключения к роутерам из базы postgresql
def get_conf_servers(src_ip, dst_ip):
    lst = []
    query = "SELECT ip_address,username,password,port FROM config_servers"
    conn = create_sql_con()
    cursor = conn.cursor()
    cursor.execute(query)
    res = cursor.fetchall()
# Создание нового списка из кортежа ответа postgresql и ip адресов src и dst
    for row in res:
        tmp_lst = (row[0], row[1], row[2], row[3], src_ip, dst_ip)
        lst.append(tmp_lst)
    cursor.close()
    conn.close()
    return lst


def sql_query(query):
    conn = create_sql_con()
    cursor = conn.cursor()
    cursor.execute(query)
    res = cursor.fetchall()
    cursor.close()
    conn.close()
    return res


# Метод для выполнения в мультипроцессорном режиме
def multi_cpu_task(lst):
    regex_template = "[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}"
    regex_template_no = "[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.255"
    dct = {}
    temp_result = ['', '', '', '', '']
    client = get_ssh_client(lst[0], lst[3], lst[1], lst[2])
    src_route = remove_g(request_ssh_data(client, f'ip route get {lst[4]}'), 'route')
    dst_route = remove_g(request_ssh_data(client, f'ip route get {lst[5]}'), 'route')
    iptables = remove_g(request_ssh_data(client, 'iptables-save'), 'iptables')
    ifaces = remove_g(request_ssh_data(client, 'ls /sys/class/net'), 'route')
    for iface in ifaces:
        if len(iface) > 0:
            if_ips = remove_g(request_ssh_data(client, f"ip a show {iface} | egrep -o '{regex_template}' | egrep -v '{regex_template_no}'"), 'route')
            dct[iface] = if_ips
    temp_result[0] = lst[0]
    temp_result[1] = src_route
    temp_result[2] = dst_route
    temp_result[3] = dct
    temp_result[4] = iptables
    client.close()
    return temp_result


# Выполнение первоначальных запросов к роутерам и формирование массива
def get_all_data(src_ip, dst_ip):
    start_time = datetime.now()
    conf_serv = get_conf_servers(src_ip, dst_ip)
    temp_result = multi_cpu(multi_cpu_task, conf_serv)
    print(f'Время выполнения скрипта {datetime.now() - start_time}')
# Получаем массив temp_result (количество индексов равно количеству роутеров) в нашем случае 4
# В каждом индексе массив с данными сервера (ip ,ip route get , dict {iface: ip's}, iptables-save )
# 0 index - ip адрес роутера (str)
# 1 index - src_ip route get [] route источника
# 2 index - dst_ip route get [] route назначения
# 3 index - ifaces + ip's {} словарь  iface : ip's
# 4 index - iptables-save [] вывод iptables-save
    return temp_result


# Ну а это main сами понимаете
if __name__ == '__main__':
    temp_results = get_all_data('10.10.10.10', '10.10.10.11')
    for router in range(len(temp_results)):
        print(f'router :: {temp_results[router][0]} ::::: src-route {temp_results[router][1][0]}  dts-route {temp_results[router][2][0]}')





