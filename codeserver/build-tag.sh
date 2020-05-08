#!/bin/bash
echo "Build CodeServer container"

echo "Current user is :"
whoami

cd /home/khanh_doth/dev/git/u-cloud/codeserver

# delete running container
docker rm -f my-running-code-server

# delete image
docker image rm khanhdo/my-code-server

# build new image
docker build -t khanhdo/my-code-server . -f Dockerfile-tag

# create new container based on new image
sh run.sh

ufw allow 6001
ufw allow 6501
ufw allow 8081