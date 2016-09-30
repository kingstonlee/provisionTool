#!/bin/bash

INITSCRIPT='/opt/provisionTool.init.sh'

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

# Is Apache running?
if (( $(ps -ef | grep -v grep | grep apache2 | wc -l) > 0 )); then
  echo "apache2 is running!"
else
  /etc/init.d/apache2 start
fi

crontabcheck=`crontab -l | grep ${INITSCRIPT}`
# If:
# res = 0 the command is already in the cron tab
# res = 1 the command is not in the cron tab
if [ "$crontabcheck" -eq 1 ]; then
  echo "Init script is being added to cron"
  # Every 10 mins.
  crontab -l | { cat; echo "*/10 * * * * ${INITSCRIPT}"; } | crontab -
else
  echo "Init script is already scheduled."
fi
