#!/bin/sh
set -e

if [ ! -d /var/lib/mysql/mysql ]; then
  echo "[MariaDB] Initialisation du data directory…"
  mariadb-install-db --user=mysql --datadir=/var/lib/mysql

  sed -i "s/\$DB_ROOT_PASSWORD/$DB_ROOT_PASSWORD/" /etc/init.sql
  sed -i "s/\$DB_USER/$DB_USER/"             /etc/init.sql
  sed -i "s/\$DB_PASSWORD/$DB_PASSWORD/"     /etc/init.sql

  mariadbd --user=mysql --datadir=/var/lib/mysql --init-file=/etc/init.sql
  echo "[MariaDB] Base système créée et init.sql appliqué."
fi

exec mariadbd --no-defaults --user=mysql --datadir=/var/lib/mysql















# #!/bin/sh

# sed -i "s/\$MYSQL_ROOT_PASSWORD/$DB_ROOT_PASSWORD/" /etc/init.sql
# sed -i "s/\$MYSQL_USER/$DB_USER/" /etc/init.sql
# sed -i "s/\$MYSQL_PASSWORD/$DB_PASSWORD/" /etc/init.sql

# echo "Exec mariadb"

# exec mariadbd --no-defaults --user=mysql --datadir=/var/lib/mysql --init-file=/etc/init.sql
