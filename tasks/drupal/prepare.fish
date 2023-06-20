mkdir /tmp/drupal
cd /tmp/drupal || exit 1

composer create-project drupal/recommended-project drupal
pushd drupal || exit 1

composer require drush/drush
drush site:install standard --db-url='mysql://drupal:drupal@localhost/drupal' \
    --site-name="My Drupal site" --account-name="speedrun" \
    --account-pass="speedrun" --locale="zh-TW"

popd || exit 1
sudo chmod -R 0777 drupal
sudo chown -R www-data:www-data drupal

sudo mv drupal/ /var/www/html

sudo a2enmod rewrite
sudo systemctl restart apache2
