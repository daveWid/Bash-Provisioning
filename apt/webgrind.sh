#!/bin/bash

# Install Webgrind
WEBGRIND_BASE="/var/www/"
FOLDER_NAME="webgrind"
APACHE_CONFIG="/etc/apache2/sites-available/$FOLDER_NAME.conf"

cd $WEBGRIND_BASE
git clone git://github.com/jokkedk/webgrind.git $FOLDER_NAME

echo "Alias /$FOLDER_NAME $WEBGRIND_BASE/$FOLDER_NAME
<Directory '$WEBGRIND_BASE/$FOLDER_NAME'>
	Options -Indexes FollowSymLinks MultiViews
	AllowOverride None
	Order allow,deny
	Allow from all
</Directory>" > $APACHE_CONFIG

a2ensite $FOLDER_NAME.conf