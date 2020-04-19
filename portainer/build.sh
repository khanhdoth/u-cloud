#!/bin/bash
echo "Build Portainer container"

echo "Current user is :"
whoami

# delete running container
docker rm -f portainer

# create new container
cd /home/khanh_doth
# docker volume create portainer_data
docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /home/khanh_doth/dev/git/u-cloud/portainer/portainer_data:/data portainer/portainer
ufw allow 8000
ufw allow 9000