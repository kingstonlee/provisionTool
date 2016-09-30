#!/bin/bash
# Does Apache2 exist?
installlist="apache2 php5"

function packageInstall() {
  sudo apt-get -y install $service
}

function packageUninstall() {
  sudo apt-get -y remove $service
}

for package in ${installlist};
do
  if dpkg -s ${package} > /dev/null 2>&1 ; then
    echo "${package} already installed"
  else
    packageInstall ${package}
  fi
done
