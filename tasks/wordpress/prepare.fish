mkdir -p /tmp/wordpress
cd /tmp/wordpress || exit 1

wget https://tw.wordpress.org/latest-zh_TW.zip
unzip latest-zh_TW.zip
chmod -R 0777 wordpress
chown -R www-data:www-data wordpress

sudo mv wordpress/ /var/www/html
