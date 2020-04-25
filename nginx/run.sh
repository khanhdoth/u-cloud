#!/bin/bash
echo "Run Nginx container"

# delete running container
docker rm -f my-running-nginx

cd /home/khanh_doth
docker run -dit --name my-running-nginx -p 80:80 -p 443:443 \
    -v /home/khanh_doth/dev/git/u-cloud/nginx/default.conf:/etc/nginx/conf.d/default.conf \
    -v /home/khanh_doth/dev/git/u-cloud/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v "$PWD":/usr/share/nginx/html:ro \
    my-nginx
