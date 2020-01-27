#!/bin/bash

# This script install docker on Ubuntu
# USE THIS SCRIPT WITH SUDO
# SUDO:
# You can use it with key as :
# $ ./docker.sh your_version_os. OS version :
# 1 - amd64 (include x86_64/arm64)
# 2 - armhf
# 3 - ppc   (meaning pcc64le (IBM Power))
# 4 - s     (meaning s390x (IBM Z))
# Example: ./docker.sh 1 for install docker for amd64 platform
# If you use script without parameters, then script use amd64 default


PARAM="$1"
#Install to use a repository over HTTPS
function https {
    apt install -y apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
}
#add repository for amd64
function amd {
   add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
}
#add repository for ppc( IBM Power)
function ppc {
   add-apt-repository \
   "deb [arch=ppc64el] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
}
#add repository s390x
function z {
   add-apt-repository \
   "deb [arch=s390x] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
}
#add repository armhf
function armhf {
   add-apt-repository \
   "deb [arch=armhf] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
}
#add key
function key {
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
}

function upd {
apt update
apt install -y docker-ce docker-ce-cli containerd.io
}
echo "Installing docker https://docs.docker.com/install/linux/docker-ce/ubuntu/"
echo "thx for downloading this script "
echo "sorry for my code "
echo "write this at 2:58 a.m."
key
if [ -z "$PARAM" ]
then
 echo "Install for amd64\x86_64"
 amd
elif [ $PARAM -eq 1 ]
then
  echo "Install for amd64\x86_64"
  amd
elif [ $PARAM -eq 2 ]
then
  echo "Install for armhf"
  armhf
elif [ $PARAM -eq 3 ] 
then
 echo "Install for ppc64le (IBM Power)"
 ppc 
elif [ $PARAM -eq 4 ]
then
 echo "Install for s390x (IBM Z)"
 z
else
 echo "Install for amd64\x86_64"
 amd
fi
upd
