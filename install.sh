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

# Build postgres
docker run -dit --name my-running-postgres -v /home/khanh_doth/dev/git/u-cloud/postgres/data:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres
docker run --name some-postgres -v /my/own/datadir:/var/lib/postgresql/data -e POSTGRES_PASSWORD=mysecretpassword -d postgres:tag
ufw allow 5432

# Clone u-cloud
git clone https://github.com/khanhdoth/u-cloud

# Clone my_hello
git clone https://github.com/khanhdoth/my_hello

# Build my_hello dev container
cd my_hello
sh dev.build.sh
ufw allow 4000
ufw allow 4001

# Build Jenkins container
cd /home/khanh_doth
docker run -u 0 -dit --name my-running-jenkins -e JENKINS_OPTS="--prefix=/jenkins" -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v "$PWD:/home/host" -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins/jenkins:lts
ufw allow 8080
ufw allow 50000

# Build CodeServer container
cd /home/khanh_doth/dev/git/u-cloud/codeserver
sh buid.sh
ufw allow 8081

# Build Portainer container
cd /home/khanh_doth
docker volume create portainer_data
docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
ufw allow 8000
ufw allow 9000

