#!/bin/bash

# Install XDebug
pecl install xdebug

# Add the ini file 
echo "[XDebug]
zend_extension=/usr/lib/php/modules/xdebug.so" > /etc/php.d/xdebug.ini