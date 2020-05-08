#!/bin/bash
echo "Build Jenkins container"

echo "Current user is :"
whoami

cd /home/khanh_doth/dev/git/u-cloud/jenkins

# delete running container
docker rm -f my-running-jenkins

# create new container
cd /home/khanh_doth
# docker run -u 0 -dit --name my-running-jenkins -e JENKINS_OPTS="--prefix=/jenkins" -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v "$PWD:/home/host" -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins/jenkins:lts
docker pull jenkins/jenkins:lts
docker run -u 0 -dit --restart always --name my-running-jenkins -e JENKINS_OPTS="--prefix=/jenkins" -p 8080:8080 -p 50000:50000 -v /home/khanh_doth/dev/git/u-cloud/jenkins/jenkins_home:/var/jenkins_home -v "$PWD:/home/host" -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins/jenkins:lts

ufw allow 8080
ufw allow 50000