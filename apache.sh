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
DIFF=`diff ${CURRENTHELLOWORLD} ${GITHELLOWORLD}`
if [ ${DIFF} != "" ]; then
  echo "There's a difference!"
fi
