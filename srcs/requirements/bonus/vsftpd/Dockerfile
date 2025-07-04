FROM alpine:3.21

RUN apk add --no-cache vsftpd openssl \
    # créer un utilisateur ftpuser qui pointe home vers /var/www/html
 && adduser -D -h /var/www/html -s /sbin/nologin ftpuser \
    # mot de passe chiffré “ftppass” (change-le !)
 && echo "ftpuser:$(openssl passwd -1 ftppass)" | chpasswd -e

# copier ta conf
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]