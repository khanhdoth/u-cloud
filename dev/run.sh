#!/bin/bash

# delete running container
docker rm -f my-running-dev

# create new container based on new image
cd /home/khanh_doth
# PATHA="/tmp/cloudsql/dev-sulof-com:us-central1:hellodb"
# docker run -u 0 -dit --restart always --name my-dev --mount type=bind,source="$PATHA",destination="$PATHA" \
docker run -u 0 -dit --restart always --name my-running-dev --workdir /home/dev/git \
    -p 4000-4010:4000-4010 \
    -p 6000-6010:6000-6010 \
    -v "$PWD:/home" \
    khanhdo/my-dev
