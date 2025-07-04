FROM alpine:3.21

# install dependencies
RUN apk update && apk upgrade && apk add nginx
RUN apk add vim && apk add curl && apk add openssl

RUN mkdir -p /etc/nginx/certs

COPY ./nginx.conf /etc/nginx/.
COPY ./setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh && ./tmp/setup.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]
