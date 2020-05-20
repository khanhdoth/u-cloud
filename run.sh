#!/bin/bash

# export DEBIAN_FRONTEND=noninteractive

# update & install dependencies
apt update
apt install apt-transport-https ca-certificates curl software-properties-common gnupg2 ufw

# enable firewall ufw
ufw enable

# install Docker
# apt -y install docker.io docker-compose
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt install docker-ce docker-compose


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

# Clone project portal
git clone https://github.com/khanhdoth/portal

# Clone vs extensions
git clone https://github.com/khanhdoth/vs-extensions

# Clone project tanx
git clone https://github.com/khanhdoth/tanx

# Clone project eportal
git clone https://github.com/khanhdoth/eportal

# Clone project el_kube
git clone https://github.com/khanhdoth/el_kube

# install kubernetes
sh /home/khanh_doth/dev/git/u-cloud/codeserver/install_kubernetes.sh

# Run Nginx
sh /home/khanh_doth/dev/git/u-cloud/nginx/run.sh

# Run postgres
sh /home/khanh_doth/dev/git/u-cloud/postgres/run.sh

# Run Jenkins container
sh /home/khanh_doth/dev/git/u-cloud/jenkins/run.sh

# Run CodeServer container
sh /home/khanh_doth/dev/git/u-cloud/codeserver/run.sh

# Run dev container
sh /home/khanh_doth/dev/git/u-cloud/dev/run.sh

# Run Portainer container
sh /home/khanh_doth/dev/git/u-cloud/portainer/run.sh

# delete all unused docker images
docker image prune -a -f

# increase inotify.max_user_watches
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# install Google Cloud SDK
sh /home/khanh_doth/dev/git/u-cloud/install.google.cloud.sdk.sh