#!/bin/bash
mkdir -p /var/www/wordpress
cd /var/www/wordpress
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
sed -i -r "s/database_name_here/$DB_NAME/1"   wp-config.php
sed -i -r "s/username_here/$DB_USER/1"  wp-config.php
sed -i -r "s/password_here/$DB_PASS/1"    wp-config.php
sed -i -r "s/localhost/$DB_HOST/1"    wp-config.php 
wp core install --url=localhost/ --title=inception --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $DB_USER yel-aoun@gmail.com --role=author --user_pass=$DB_PASS --allow-root


sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir /run/php
#It is the default location for PHP-FPM to store its socket files

/usr/sbin/php-fpm7.3 -F
