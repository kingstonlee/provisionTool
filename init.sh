#!/bin/bash
# Does Apache2 exist?
if dpkg -s "apache2"; then
 echo "apache2 already installed"
else
 # Install Apache2
 sudo apt-get -y install apache2
fi

# Does php exist?
if dpkg -s "php5"; then
 echo "php5 already installed"
else
 # Install PHP
 sudo apt-get -y install php5
fi

# Is Apache running?
if (( $(ps -ef | grep -v grep | grep apache2 | wc -l) > 0 )); then
  echo "$service is running!!!"
else
  /etc/init.d/$service start
fi
