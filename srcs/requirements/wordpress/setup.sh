wp config create --dbname=wordpress --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost=mariadb --force

wp core is-installed || wp core install --url=maecarva.42.fr --title="InceptionPress" --admin_user="$WP_USER1" \
	--admin_password="$WP_PASS1" --admin_email="$WP_USER1"@mail.org --skip-email


wp user create "$WP_USER2" "$WP_USER2"@mail.org --user_pass="$WP_PASS2"

wp theme install inspiro --activate

exec php-fpm -F
