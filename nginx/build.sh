#!/bin/bash
echo "Build Nginx container"

echo "Current user is :"
whoami

cd /home/khanh_doth/dev/git/u-cloud/nginx

# delete running container
docker rm -f my-running-nginx

# delete image
docker image rm my-nginx:pre
docker image rm my-nginx

# build new image
docker build -t my-nginx:pre .

# create new container based on new image
cd /home/khanh_doth
docker run -dit --name my-running-nginx -p 80:80 -p 443:443 -v "$PWD":/usr/share/nginx/html:ro my-nginx:pre
docker exec -it my-running-nginx certbot --nginx --non-interactive --agree-tos -m khanh.do@sulof.com -d im.sulof.com

docker commit my-running-nginx my-nginx
docker rm -f my-running-nginx
docker image rm my-nginx:pre
sh /home/khanh_doth/dev/git/u-cloud/nginx/run.sh

ufw allow 80
ufw allow 443