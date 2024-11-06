#!/usr/bin/python3.6
import os
import ldap
import re
import socket
import syslog


def rm_g(lst):
    lst = str(lst).split("'")
    r_lst = ''
    for i in range(len(lst)):
        match_1 = re.search(r'\[b', lst[i])
        match_2 = re.search(r']', lst[i])
        if not match_1 and not match_2:
            r_lst = f'{lst[i]}'
    return r_lst


def fail():
    headers = 'Auth-Status: Invalid login or password'
    print(headers)
    print()


def fail_2():
    headers = 'Auth-Status: Ou not Found'
    print(headers)
    print()


def fail_3():
    headers = 'Auth-Status: mailHost not Found'
    print(headers)
    print()


def fail_4():
    headers = 'Auth-Status: ldap server is down'
    print(headers)
    print()


def response_headers(server, port):
    headers1 = f'Auth-Status: OK'
    headers2 = f'Auth-Server: {server}'
    headers3 = f'Auth-Port: {port}'
    print(headers1)
    print(headers2)
    print(headers3)
    print()


def check_username(username):
    name = str(username).partition('@')[0]
    return name


def check_domain(username):
    domain = str(username).partition('@')[2]
    return domain


def get_mail_host(username, password, domain):
    ad = ldap.initialize("ldaps://")
    ad.protocol_version = ldap.VERSION3
    try:
        ad.simple_bind_s(f'cn={username}, ou=Users,ou={domain},ou=Mail,dc=protei,dc=ru', f'{password}')
    except ldap.INVALID_CREDENTIALS:
        return 1
    except ldap.UNWILLING_TO_PERFORM:
        return 1
    except ldap.SERVER_DOWN:
        return 4
    basedn = f'ou=Users,ou={domain},ou=Mail,dc=protei,dc=ru'
    scope = ldap.SCOPE_ONELEVEL
    filterexp = f'(&(ObjectClass=person)(cn={username}))'
    attrlist = ['mailHost']
    try:
        results = ad.search_s(basedn, scope, filterexp, attrlist)
    except ldap.NO_SUCH_OBJECT:
        return 2
    mailHost = None
    if results[0][1]:
        mailHost = results[0][1].get('mailHost')
    return mailHost


def dns_lookup(domain):
    ip = ''
    ip_addr = socket.getaddrinfo(domain, 0)
    if ip_addr[2][0] is socket.AddressFamily.AF_INET and ip_addr[2][1] is socket.SocketKind.SOCK_RAW:
        ip = ip_addr[2][4][0]
    return ip


def get_mail_port(http_proto):
    http_port = None
    if http_proto == 'imap':
        http_port = 1143
    if http_proto == 'pop3':
        http_port = 1110
    return http_port


def sys_log(user ,msg_number, client_ip):
    msg = None
    msg1 = f'Client[{client_ip}] {user} invalid login or password'
    msg2 = f'Client[{client_ip}] {user} ou not found'
    msg3 = f'Client[{client_ip}] {user} mailHost not found'
    msg4 = f'Client[{client_ip}] {user} ldap server is down'
    if msg_number == 1:
        msg = msg1
    if msg_number == 2:
        msg = msg2
    if msg_number == 3:
        msg = msg3
    if msg_number == 4:
        msg = msg4
    syslog.openlog(logoption=syslog.LOG_PID, facility=syslog.LOG_MAIL)
    syslog.syslog(msg)


def do_job():
    if os.environ.get('HTTP_AUTH_USER') is not None  and os.environ.get('HTTP_AUTH_PASS') is not None:
        http_user = os.environ.get('HTTP_AUTH_USER')
        http_password = os.environ.get('HTTP_AUTH_PASS')
        http_password = http_password.replace('%20',' ')
        http_password = http_password.replace('%25','%')
        http_proto = os.environ.get('HTTP_AUTH_PROTOCOL')
        client_ip = os.environ.get('HTTP_CLIENT_IP')
        http_port = get_mail_port(http_proto)
        user = check_username(http_user)
        domain = check_domain(http_user)
        if domain == '':
            domain = 'protei.ru'
        mail_host = get_mail_host(user, http_password, domain)
        if mail_host == 1:
            fail()
            sys_log(http_user, 1, client_ip)
            return
        if mail_host == 2:
            fail_2()
            sys_log(http_user, 2, client_ip)
            return
        if mail_host == 4:
            fail_4()
            sys_log(http_user, 4, client_ip)
            return
        if mail_host is None:
            fail_3()
            sys_log(http_user, 3, client_ip)
            return
        mail_server_ip = dns_lookup(rm_g(mail_host))
        response_headers(mail_server_ip, http_port)
        return
    fail()
    return


if __name__ == '__main__':
    do_job()
