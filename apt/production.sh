#!/bin/bash

# Update apt
sudo apt-get -y update
sudo apt-get -y upgrade

# Install lamp
sudo apt-get -y install apache2
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo apt-get -y install libapache2-mod-php5 php5-dev php-pear

# Secure MySQL
sudo /usr/bin/mysql_secure_installation

# Install other tools
sudo apt-get -y install git-core vim phpmyadmin

# Setup the apache site
sudo /vagrant/apt/vhost.sh

# And boot Apache
sudo apache2ctl graceful

# And clean apt
sudo apt-get -y clean

# Success message
echo "Installation complete!"
