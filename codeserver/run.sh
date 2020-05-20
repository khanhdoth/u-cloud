#!/bin/bash

# delete running container
docker rm -f my-running-code-server

# create new container based on new image
cd /home/khanh_doth
docker run -u 0 -dit --restart always --name my-running-code-server \
    -p 8081:8080 \
    -v "$PWD:/home/coder/project" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/bin/docker:/usr/bin/docker khanhdo/my-code-server --auth none
