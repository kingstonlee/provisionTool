#!/bin/bash
CURRENTHELLOWORLD=/var/www/html/helloworld.php
GITHELLOWORLD=/opt/provisionTool/apache2/helloworld.php
CURRENTAPACHE2CONFIG=/etc/apache2/apache2.conf
GITAPACHE2CONFIG=/opt/provisionTool/apache2/apache2.conf

function apacheConfigtestRestart() {
  if [[ $(apache2ctl configtest) ]]; then
    /etc/init.d/apache2 reload
    echo "Apache Reloaded"
  else
    echo "ERROR CONFIGTEST FAILED"
  fi
}

# Is Apache running?
if (( $(ps -ef | grep -v grep | grep apache2 | wc -l) > 0 )); then
  echo "apache2 is running!"
else
  /etc/init.d/apache2 start
fi

# Are there changes to Apache Hello World file?
if ! [ -f ${CURRENTHELLOWORLD} ]; then
  echo "Hello World Script copied!"
  cp $GITHELLOWORLD $CURRENTHELLOWORLD
elif cmp ${CURRENTHELLOWORLD} ${GITHELLOWORLD}; then
  echo "No change needed!"
else
  echo "Updating Hello World Script!"
  cp $GITHELLOWORLD $CURRENTHELLOWORLD
fi

# Changes to apached config files
if cmp ${CURRENTAPACHE2CONFIG} ${GITAPACHE2CONFIG}; then
  echo "No Apache config change"
else
  echo "ConfigTesting new change"
  apacheConfigtestRestart
