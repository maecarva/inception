FROM alpine:3.21

# install dependencies
RUN apk update && apk upgrade && apk add mariadb mariadb-client
RUN apk add vim && apk add curl

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY init.sql /etc/init.sql
COPY setup.sh /etc/setup.sh

RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db
