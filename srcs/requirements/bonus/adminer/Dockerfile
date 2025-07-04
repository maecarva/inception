FROM alpine:3.21

RUN apk update && apk upgrade && apk add curl ca-certificates && update-ca-certificates

WORKDIR /var/www/html

COPY setup.sh /etc/setup.sh

ENTRYPOINT [ "sh" , "/etc/setup.sh"]
