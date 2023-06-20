mkdir -p /tmp/wordpress
cd /tmp/wordpress || exit 1

wget https://tw.wordpress.org/latest-zh_TW.zip
wget "https://downloads.wordpress.org/plugin/elementor.3.14.0.zip" 
wget "https://downloads.wordpress.org/theme/astra.4.1.5.zip"

unzip latest-zh_TW.zip
unzip elementor.3.14.0.zip
unzip astra.4.1.5.zip

cp -rv astra/ wordpress/wp-content/themes/
cp -rv elementor/ wordpress/wp-content/plugins/

sudo chmod -R 0777 wordpress
sudo chown -R www-data:www-data wordpress

sudo mv wordpress/ /var/www/html
