if ! [ -x "$(command -v git)" ]; then
  echo 'git is not installed.' >&2
  apt-get install git
fi

cd /opt
git clone https://github.com/kingstonlee/provisionTool.git
