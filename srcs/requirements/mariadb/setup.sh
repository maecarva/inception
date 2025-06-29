#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mariadbd --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock &
PID=$!

for i in $(seq 1 $END); do 
	if mariadb-admin ping --silent --socket=/run/mysqld/mysqld.sock; then
		break
	fi
	sleep 1
done

mysql --protocol=socket -uroot <<-EOSQL
  ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
  DELETE FROM mysql.user WHERE User='';
  DROP DATABASE IF EXISTS test;
  FLUSH PRIVILEGES;
EOSQL

mysql --protocol=socket -uroot <<-EOSQL
	CREATE DATABASE IF NOT EXISTS ${DB_NAME};
	CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
	GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%';
	FLUSH PRIVILEGES;
EOSQL

kill "$pid"
wait "$pid"

# exec bdd au premier plan
exec "$@"

