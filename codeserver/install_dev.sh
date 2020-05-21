#!/bin/bash

# install code-server in VM
CS_FILE=code-server-3.3.1-linux-x86_64.tar.gz
cd /home/khanh_doth
mkdir code-server
cd code-server
wget https://github.com/cdr/code-server/releases/download/v3.3.1/$CS_FILE
tar -xzvf $CS_FILE
cd $CS_FILE
cp code-server /usr/local/bin
cp /home/khanh_doth# cd dev/git/u-cloud/codeserver/code-server.service /lib/systemd/system/code-server.service
systemctl start code-server
systemctl status code-server




