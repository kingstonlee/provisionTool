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
elif [ diff ${CURRENTHELLOWORLD} ${GITHELLOWORLD} != "" ]; then
  echo "There's a difference!"
else
  echo "No change needed"
fi
