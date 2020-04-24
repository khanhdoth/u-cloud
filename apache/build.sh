#!/bin/bash
echo "Build Apache HTTDP container"

echo "Current user is :"
whoami

cp -r /home/khanh_doth/dev/git/u-cloud/cert /home/khanh_doth/dev/git/u-cloud/apache/cert
cd /home/khanh_doth/dev/git/u-cloud/apache

# delete running container
docker rm -f my-running-apache

# delete image
docker image rm my-apache

# build new image
docker build -t my-apache .

rm -r /home/khanh_doth/dev/git/u-cloud/apache/cert

# create new container based on new image
cd /home/khanh_doth
docker run -dit --name my-running-apache -p 80:80 -p 443:443 -v "$PWD":/usr/local/apache2/htdocs/ my-apache

ufw allow 80
ufw allow 443