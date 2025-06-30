#!/bin/sh

sed -i "s/\$MYSQL_ROOT_PASSWORD/$DB_ROOT_PASSWORD/" /etc/init.sql
sed -i "s/\$MYSQL_USER/$DB_USER/" /etc/init.sql
sed -i "s/\$MYSQL_PASSWORD/$DB_PASSWORD/" /etc/init.sql

exec mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/etc/init.sql
