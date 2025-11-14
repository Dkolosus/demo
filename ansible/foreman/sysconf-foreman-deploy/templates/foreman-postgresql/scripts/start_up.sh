#!/bin/bash
PATH=/sbin:/usr/sbin:/bin:/usr/bin

su -l postgres -c "/usr/lib/postgresql/14/bin/initdb -D  /var/lib/postgresql/14/data -E 'UTF-8' --lc-collate='en_US.UTF-8' --lc-ctype='en_US.UTF-8'"

cp /opt/postgresql/pg_hba.conf /var/lib/postgresql/14/data/pg_hba.conf
cp /opt/postgresql/postgresql.conf /var/lib/postgresql/14/data/postgresql.conf

exec su -l postgres -c "/usr/lib/postgresql/14/bin/postgres -D /var/lib/postgresql/14/data"

