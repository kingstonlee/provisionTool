#!/bin/bash

if ! [ -x "$(command -v git)" ]; then
  echo 'git is not installed.' >&2
  apt-get install -y git
fi


if ! [ -d "/opt/provisionTool" ]; then
  cd /opt
  git clone https://github.com/kingstonlee/provisionTool.git
fi
