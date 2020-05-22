#!/bin/bash

# install code-server in VM
CS_NAME=code-server-3.3.1-linux-x86_64
CS_FILE=$CS_NAME.tar.gz

cd /home/khanh_doth
mkdir code-server
cd code-server
wget https://github.com/cdr/code-server/releases/download/v3.3.1/$CS_FILE
tar -xzvf $CS_FILE
cd $CS_NAME
cp code-server /usr/local/bin
cp /home/khanh_doth/dev/git/u-cloud/codeserver/code-server.service /lib/systemd/system/code-server.service
systemctl start code-server
systemctl status code-server




