#!/bin/bash

exec /usr/sbin/dhcpd -4 -d -f -cf "/etc/dhcp/dhcpd.conf"
