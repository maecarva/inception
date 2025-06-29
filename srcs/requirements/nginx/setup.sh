#!/bin/sh

export LOGNAME=maecarva

openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout /etc/nginx/certs/inception.key \
    -out /etc/nginx/certs/inception.crt \
    -subj "/C=MO/ST=KH/O=42/OU=42/CN=${LOGNAME}.42.fr"

sed -i.bak "s|\${LOGNAME}|${LOGNAME}|g" /etc/nginx/nginx.conf \
		&& rm /etc/nginx/nginx.conf.bak
