FROM alpine:3.21

RUN apk update && apk upgrade && apk add g++ make python3 php

COPY webserv /etc/webserv
COPY start.sh /etc/start.sh

RUN chmod +x /etc/start.sh

ENTRYPOINT [ "sh" , "/etc/start.sh"]