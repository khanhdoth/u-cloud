#!/bin/bash

# export DEBIAN_FRONTEND=noninteractive

sudo su

# update
apt update

# install Docker
apt -y install docker.io

# Build my_hello dev container
cd /home/khanhdoth
mkdir dev

cd dev
mkdir git

cd git
git clone https://github.com/khanhdoth/my_hello

cd my_hello
sh dev.build.sh

# Build Jenkins container
cd /home/khanhdoth
docker run -u 0 -dit --name my-running-jenkins -e JENKINS_OPTS="--prefix=/jenkins" -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v "$PWD:/home/host" -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins/jenkins:lts

# Build CodeServer container
cd /home/khanhdoth
docker run -u 0 -dit --name my-code-server -p 8081:8080 -v "$PWD:/home/coder/project" -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker codercom/code-server --auth none 

# Build Portainer container
cd /home/khanhdoth
docker volume create portainer_data
docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer


