adduser --disabled-password "$FTP_USER"
echo "$FTP_USER":"$FTP_PASS" | chpasswd

usermod --home /var/www/html "$FTP_USER"
chown "$FTP_USER":"$FTP_USER" /var/www/html

echo "$FTP_USER" > /etc/vsftpd/vsftpd.allowed_users

exec vsftpd /etc/vsftpd/vsftpd.conf
