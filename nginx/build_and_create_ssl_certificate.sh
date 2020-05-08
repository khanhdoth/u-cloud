#!/bin/bash
echo "Build Nginx container"

echo "Current user is :"
whoami

cd /home/khanh_doth/dev/git/u-cloud/nginx

# delete running container
docker rm -f my-running-nginx

# delete image
docker image rm khanhdo/my-nginx:pre
docker image rm khanhdo/my-nginx

# build new image
docker build -t khanhdo/my-nginx:pre . -f without_ssl_certificate.Dockerfile

# create new container based on new image
cd /home/khanh_doth
docker run -dit --name my-running-nginx -p 80:80 -p 443:443 -v "$PWD":/usr/share/nginx/html:ro khanhdo/my-nginx:pre
docker exec -it my-running-nginx certbot --nginx --non-interactive --agree-tos -m khanh.do@sulof.com -d dev.sulof.com

docker commit my-running-nginx khanhdo/my-nginx
docker rm -f my-running-nginx
docker image rm khanhdo/my-nginx:pre
sh /home/khanh_doth/dev/git/u-cloud/nginx/run.sh

ufw allow 80
ufw allow 443