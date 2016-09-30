#!/bin/bash
# Does Apache2 exist?
if dpkg -s "apache2" > /dev/null 2>&1 ; then
 echo "apache2 already installed"
else
 # Install Apache2
 sudo apt-get -y install apache2
fi

# Does php exist?
if dpkg -s "php5" > /dev/null 2>&1 ; then
 echo "php5 already installed"
else
 # Install PHP
 sudo apt-get -y install php5
fi
