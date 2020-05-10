#!/bin/bash

# delete running container
docker rm -f my-dev

# create new container based on new image
cd /home/khanh_doth
# PATHA="/tmp/cloudsql/dev-sulof-com:us-central1:hellodb"
# docker run -u 0 -dit --restart always --name my-running-code-server -p 8081:8080 -p 4000-5000:4000-5000 -p 6000-7000:6000-7000 -v "$PWD:/home/coder/project" -v /var/run/docker.sock:/var/run/docker.sock -v "/tmp/cloudsql/dev-sulof-com:us-central1:hellodb":"/tmp/cloudsql/dev-sulof-com:us-central1:hellodb" -v /usr/bin/docker:/usr/bin/docker khanhdo/my-code-server --auth none
# docker run -u 0 -dit --restart always --name my-running-code-server --mount type=bind,source="$PATHA",destination="$PATHA" \
docker run -u 0 -dit --restart always --name my-dev \
    -p 4000-5000:4000-5000 \
    -p 6000-7000:6000-7000 \
    khanhdo/my-dev
