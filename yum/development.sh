#!/bin/bash

# Update yum
sudo yum -y update

# Install lamp
sudo yum -y install httpd
sudo yum -y install mysql mysql-devel ruby-mysql mysql-server
sudo yum -y install php53 php53-devel php53-cli php-pear php53-mysql php53-gd php53-mbstring

# Start MySQL and secure
sudo /sbin/service mysqld restart
sudo /usr/bin/mysql_secure_installation

# Install other tools
sudo yum -y install git vim-enhanced

# Install xdebug
sudo /vagrant/yum/xdebug.sh

# Install mcrypt
sudo /vagrant/yum/mcrypt.sh

# Add phpmyadmin
sudo /vagrant/yum/phpmyadmin.sh

# Add Webgrind
sudo /vagrant/yum/webgrind.sh

# Setup the apache site
sudo /vagrant/yum/vhost.sh

# And boot Apache and MySQL
sudo /sbin/service httpd restart

# Make sure apache and mysql start on boot
sudo /sbin/chkconfig httpd on
sudo /sbin/chkconfig mysqld on

# And clean yum
sudo yum -y clean all

# Success message
echo "Installation complete!"
