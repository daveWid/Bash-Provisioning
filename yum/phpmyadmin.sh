#!/bin/bash

# Install phpMyAdmin
PMA_BASE="/var/www/html"
PMA_NAME="phpmyadmin"
PMA_PATH=$PMA_BASE/$PMA_NAME

wget http://prdownloads.sourceforge.net/phpmyadmin/phpMyAdmin-2.11.11.3-english.tar.gz?download
tar xvfz phpMyAdmin-2.11.11.3-english.tar.gz
mv phpMyAdmin-2.11.11.3-english $PMA_PATH

# Cleanup
rm -R phpMyAdmin*

# Set the new configuration
echo "Alias /$PMA_NAME $PMA_PATH/
<Directory '$PMA_PATH/'>
	Options -Indexes FollowSymLinks MultiViews
	AllowOverride None
	Order allow,deny
	Allow from all
</Directory>" > /etc/httpd/conf.d/phpmyadmin.conf

# Setup the config file
echo "<?php

/* Servers configuration */
\$i = 0;

/* Server localhost */
\$i++;
\$cfg['Servers'][\$i]['host'] = 'localhost';
\$cfg['Servers'][\$i]['extension'] = 'mysqli';
\$cfg['Servers'][\$i]['connect_type'] = 'socket';
\$cfg['Servers'][\$i]['compress'] = false;
\$cfg['Servers'][\$i]['auth_type'] = 'config';
\$cfg['Servers'][\$i]['user'] = 'root';
\$cfg['Servers'][\$i]['password'] = '';

/* End of servers configuration */
\$cfg['UploadDir'] = '/vagrant/data/uploads';" > $PMA_PATH/config.inc.php

# Open up the file to add in the password
sudo vim $PMA_PATH/config.inc.php
