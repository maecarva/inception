#!/bin/sh

if [ ! -d /var/lib/mysql/mysql ]; then
  mariadb-install-db --user=mysql --datadir=/var/lib/mysql

  sed -i "s/\$DB_ROOT_PASSWORD/$DB_ROOT_PASSWORD/" /etc/init.sql
  sed -i "s/\$DB_NAME/$DB_NAME/" /etc/init.sql
  sed -i "s/\$DB_USER/$DB_USER/"             /etc/init.sql
  sed -i "s/\$DB_PASSWORD/$DB_PASSWORD/"     /etc/init.sql

  mariadbd --user=mysql --datadir=/var/lib/mysql --init-file=/etc/init.sql
fi

exec mariadbd --no-defaults --user=mysql --datadir=/var/lib/mysql
