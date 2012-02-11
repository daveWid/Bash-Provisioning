#!/bin/bash

# Update apt
sudo apt-get -y update
sudo apt-get -y upgrade

# Install lamp
sudo apt-get -y install apache2
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo apt-get -y install libapache2-mod-php5 php5-dev php5-ldap php-pear

# Secure MySQL
sudo /usr/bin/mysql_secure_installation

# Install other tools
sudo apt-get -y install git-core vim phpmyadmin

# Install xdebug
sudo sh xdebug.sh

# Add Webgrind
sudo sh webgrind.sh

# Setup the apache site
sudo sh vhost.sh

# A few more apache mods
sudo a2enmod rewrite
sudo a2dissite default

# And boot Apache
sudo apache2ctl graceful

# And clean apt
sudo apt-get -y clean

# Add Pear Development Tools
sudo pear upgrade pear
sudo pear config-set auto_discover 1
sudo pear install pear.phpunit.de/PHPUnit
sudo pear install --alldeps pear.phing.info/phing

# Success message
echo "Installation complete!"
