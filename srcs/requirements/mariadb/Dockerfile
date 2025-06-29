FROM alpine:3.21

# install dependencies
RUN apk update && apk upgrade && apk add mariadb mariadb-client
RUN apk add vim && apk add curl

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY setup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["setup.sh"]
CMD ["mysqld"]
