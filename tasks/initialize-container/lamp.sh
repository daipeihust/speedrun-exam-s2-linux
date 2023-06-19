#!/usr/bin/env bash
# -*- coding: utf-8 -*-

sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql php-tidy
sudo systemctl restart apache2

sudo apt install -y phpmyadmin

sudo mysql -u root << EOF
    GRANT ALL ON *.* TO 'phpmyadmin'@'localhost';
    FLUSH PRIVILEGES;
EOF
