echo "[WP config] Waiting for MariaDB..."
until mariadb-admin ping -h "${DB_HOST}" -u "${DB_USER}" -p"${DB_PASSWORD}" --silent; do
	echo "cant contact db"
	sleep 3
done
echo "[WP config] MariaDB accessible."

wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost=mariadb:3306 --force

wp core is-installed || wp core install --url="$WP_SITE_URL" --title="$WP_SITE_TITLE" --admin_user="$WP_USER1" \
	--admin_password="$WP_PASS1" --admin_email="$WP_USER1"@mail.org --skip-email

wp user create "$WP_USER2" "$WP_USER2"@mail.org --user_pass="$WP_PASS2"

wp theme install twentytwentyone --activate

wp plugin install redis-cache --activate
wp config set WP_REDIS_HOST "redis"
wp redis enable

exec php-fpm83 -F
