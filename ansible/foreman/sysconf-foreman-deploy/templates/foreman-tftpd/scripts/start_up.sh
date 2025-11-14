#!/bin/bash

chown -R nobody:nogroup /srv/tftp 
chmod -R 777 /srv/tftp

exec /usr/sbin/in.tftpd -L -vvv --listen --user tftp --address :69 --secure /srv/tftp

