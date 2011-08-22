#!/bin/bash

# Install XDebug
pecl install xdebug

# Add the ini file 
echo "[XDebug]
zend_extension=/usr/lib/php5/20090626+lfs/xdebug.so" > /etc/php5/apache2/conf.d/xdebug.ini