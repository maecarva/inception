#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout /etc/nginx/certs/inception.key \
    -out /etc/nginx/certs/inception.crt \
    -subj "/C=MO/ST=KH/O=42/OU=42/CN=inception"
