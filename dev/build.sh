#!/bin/bash
echo "Build dev container"

echo "Current user is :"
whoami

cd /home/khanh_doth/dev/git/u-cloud/dev

# delete running container
docker rm -f my-running-dev

# delete image
docker image rm khanhdo/my-dev

# build new image
docker build -t khanhdo/my-dev .

# create new container based on new image
sh run.sh