FROM alpine:3.21

RUN apk add --no-cache vsftpd shadow
# copier ta conf
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh /etc/start.sh

ENTRYPOINT [ "sh", "/etc/start.sh" ]