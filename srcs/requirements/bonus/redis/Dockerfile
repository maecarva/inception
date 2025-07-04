FROM alpine:3.21

RUN apk -U upgrade && apk add redis

ENTRYPOINT ["redis-server", "--protected-mode no"]