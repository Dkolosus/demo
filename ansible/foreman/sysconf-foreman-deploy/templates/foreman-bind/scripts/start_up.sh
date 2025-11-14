#!/bin/sh

chown -R bind:bind /var/cache/bind

exec /usr/sbin/named -g -c "/etc/bind/named.conf" -u bind
