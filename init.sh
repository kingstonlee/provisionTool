#!/bin/bash

INITSCRIPT='/opt/provisionTool.init.sh'

echo "Checking if script is regularly scheduled to run"
crontab -l | grep ${INITSCRIPT} > /dev/null 2>&1
crontabcheck=`echo $?`
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
echo "Script Schedule Checked"

echo "Checking Required Packages are Installed"
exec /opt/provisionTool/packages.sh
echo "Packages Checked"

echo "Checking Services are Running"
exec /opt/provisionTool/services.sh
echo "Services Checked"
