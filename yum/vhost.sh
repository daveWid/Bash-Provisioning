#!/bin/bash
SITE_PATH="/vagrant/html"
SITE_NAME="darkwing.bgsu.edu"

echo "<VirtualHost *:80>
    DocumentRoot $SITE_PATH
    ServerName $SITE_NAME
    ErrorLog \"/var/log/httpd/$SITE_NAME-error_log\"
    CustomLog \"/var/log/httpd/$SITE_NAME-access_log\" common
    <Directory \"$SITE_PATH\">
    	Options -Indexes FollowSymLinks MultiViews
    	AllowOverride All
    	Order Deny,Allow
    	Allow from all
    </Directory>
</VirtualHost>" > /etc/httpd/conf.d/$SITE_NAME.conf