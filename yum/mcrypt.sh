#!/bin/bash

# Install MCrypt
yum -y install libmcrypt-devel
wget http://museum.php.net/php5/php-5.3.3.tar.bz2
tar xvjf php-5.3.3.tar.bz2
cd php-5.3.3/ext/mcrypt/
phpize
./configure
make
make install

# Clean up
cd ../../../
rm -R php-*

# Add the config file 
echo "[mcrypt]
extension=mcrypt.so" > /etc/php.d/mcrypt.ini