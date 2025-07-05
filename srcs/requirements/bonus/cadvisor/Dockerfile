FROM alpine:3.21

RUN apk update && apk upgrade && apk add curl gcompat ca-certificates

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.53.0/cadvisor-v0.53.0-linux-amd64 \
 -o /usr/bin/cadvisor

RUN chmod +x /usr/bin/cadvisor

ENTRYPOINT [ "/usr/bin/cadvisor" ]