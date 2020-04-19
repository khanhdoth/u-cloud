#!/bin/bash

# export DEBIAN_FRONTEND=noninteractive

# update
apt update

# enable firewall ufw
ufw enable

# install Docker
apt -y install docker.io

cd /home/khanh_doth
mkdir dev
cd dev
mkdir git
cd git

# Clone u-cloud
git clone https://github.com/khanhdoth/u-cloud

# Clone my_hello
git clone https://github.com/khanhdoth/my_hello

# Build postgres
sh /home/khanh_doth/dev/git/u-cloud/postgres/build.sh

# Build my_hello dev container
sh /home/khanh_doth/dev/git/my_hello/dev.build.sh

# Build Jenkins container
sh /home/khanh_doth/dev/git/u-cloud/jenkins/build.sh

# Build CodeServer container
sh /home/khanh_doth/dev/git/u-cloud/codeserver/build.sh

# Build Portainer container
sh /home/khanh_doth/dev/git/u-cloud/portainer/build.sh