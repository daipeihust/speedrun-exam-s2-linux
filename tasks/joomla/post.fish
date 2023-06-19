mkdir -p /tmp/joomla
cd /tmp/joomla || exit 1

wget -O "joomla.zip" "https://downloads.joomla.org/cms/joomla4/4-3-2/Joomla_4-3-2-Stable-Full_Package.zip?format=zip"

mkdir joomla
unzip -d joomla/ joomla.zip
chmod -R 0777 joomla
chown -R www-data:www-data joomla

sudo mv joomla/ /var/www/html
