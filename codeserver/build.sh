#!/bin/bash
echo "Build CodeServer container"

echo "Current user is :"
whoami

cd /home/khanh_doth/dev/git/u-cloud/codeserver

# delete running container
docker rm -f my-running-code-server

# delete image
docker image rm my-code-server

# build new image
docker build -t my-code-server .

# create new container based on new image
cd /home/khanh_doth
docker run -u 0 -dit --name my-running-code-server -p 8081:8080 -v "$PWD:/home/coder/project" -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker my-code-server --auth none

ufw allow 8081