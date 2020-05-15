#!/bin/bash

# export DEBIAN_FRONTEND=noninteractive

# update
apt update

# enable firewall ufw
ufw enable

# install Docker
apt -y install docker.io docker-compose

# install kubernetes
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

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