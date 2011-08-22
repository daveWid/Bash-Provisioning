#!/bin/bash
SITE_PATH="/vagrant/html"
SITE_NAME="localhost"

echo "<VirtualHost *:80>
    DocumentRoot $SITE_PATH
    ServerName $SITE_NAME
    ErrorLog \"/var/log/apache2/$SITE_NAME-error_log\"
    CustomLog \"/var/log/apache2/$SITE_NAME-access_log\" common
    <Directory \"$SITE_PATH\">
    	Options -Indexes FollowSymLinks MultiViews
    	AllowOverride All
    	Order Deny,Allow
    	Allow from all
    </Directory>
</VirtualHost>" > /etc/apache2/sites-available/$SITE_NAME.conf

a2ensite $SITE_NAME.conf