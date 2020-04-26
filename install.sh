#!/bin/bash

# export DEBIAN_FRONTEND=noninteractive

# update
apt update

# enable firewall ufw
ufw enable

# install Docker
apt -y install docker.io docker-compose

# delete folder dev 
rm -R /home/khanh_doth/dev

# create dev/git and clone projects from git
cd /home/khanh_doth
mkdir dev
cd dev
mkdir git
cd git

# Clone project u-cloud
git clone https://github.com/khanhdoth/u-cloud

# Clone project my_hello
git clone https://github.com/khanhdoth/my_hello

# Clone project flutter_app
git clone https://github.com/khanhdoth/flutter_app

# Clone project phoenix liveview demo
git clone https://github.com/khanhdoth/demo

# Build postgres
sh /home/khanh_doth/dev/git/u-cloud/postgres/build.sh

# Build my_hello dev container
sh /home/khanh_doth/dev/git/my_hello/dev.build.sh

# Build Jenkins container
sh /home/khanh_doth/dev/git/u-cloud/jenkins/build.sh

# Build my_hello prod container
sh /home/khanh_doth/dev/git/my_hello/prod.build.sh

# Build CodeServer container
sh /home/khanh_doth/dev/git/u-cloud/codeserver/build.sh

# Build Portainer container
sh /home/khanh_doth/dev/git/u-cloud/portainer/build.sh

# delete all unused docker images
docker image prune -a -f

# increase inotify.max_user_watches
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p