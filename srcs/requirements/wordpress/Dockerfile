FROM alpine:3.21

# # install dependencies
# RUN apk update && apk upgrade && apk add mariadb mariadb-client
# RUN apk add vim && apk add curl

# RUN apk add php php-phar php-fpm php-mysqli php-iconv mysql-client php-json php-curl php-dom php-exif php-fileinfo php-mbstring php-openssl php-xml php-zip php-tokenizer php-session

# COPY php.conf /etc/php81/php-fmp.d/php.conf

# RUN mkdir /var/www && mkdir /var/www/wordpress

# RUN curl https://fr.wordpress.org/wordpress-6.8.1-fr_FR.tar.gz -o wp.tar.gz
# RUN tar -xvf wp.tar.gz && mv wordpress/* /var/www/wordpress

# RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp

# COPY setup.sh /etc/setup.sh

# ENTRYPOINT [ "sh" , "/etc/setup.sh"]

RUN apk -U upgrade && apk add curl php php-phar php-fpm php-mysqli php-iconv mysql-client \
 php-json php-curl php-dom php-exif php-fileinfo php-mbstring php-openssl php-xml php-zip \
 php-tokenizer php-session
COPY php.conf /etc/php81/php-fpm.d/www.conf

WORKDIR /var/www/wordpress
RUN curl https://fr.wordpress.org/wordpress-6.8.1-fr_FR.tar.gz -o latest.tar.gz
RUN tar xzf latest.tar.gz && rm latest.tar.gz && mv wordpress/* . \
	&& rmdir wordpress
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp-cli.phar \
 && chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp

COPY setup.sh /etc/setup.sh

ENTRYPOINT ["sh", "/etc/setup.sh"]