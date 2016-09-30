#!/bin/bash
CURRENTHELLOWORLD=/var/www/html/helloworld.php
GITHELLOWORLD=/opt/provisionTool/helloworld.php

# Is Apache running?
if (( $(ps -ef | grep -v grep | grep apache2 | wc -l) > 0 )); then
  echo "apache2 is running!"
else
  /etc/init.d/apache2 start
fi

# Are there changes to Apache config file?
if ! [ -f ${CURRENTHELLOWORLD} ]; then
  echo "Hello World Script copied!"
  cp $GITHELLOWORLD $CURRENTHELLOWORLD
elif cmp ${CURRENTHELLOWORLD} ${GITHELLOWORLD}; then
  echo "No change needed!"
else
  echo "Updating Hello World Script!"
  cp $GITHELLOWORLD $CURRENTHELLOWORLD
fi
