FROM alpine:3.21

RUN apk update && apk upgrade && apk add curl

WORKDIR /var/www/html

RUN curl https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php -o adminer.php