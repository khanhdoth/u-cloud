#!/bin/bash

CS_VERSION=code-server-3.2.0-linux-arm64.tar.gz
useradd -m -s /bin/bash code
passwd code
su - code
wget https://github.com/cdr/code-server/releases/download/3.2.0/$CS_VERSION
tar -xf $CS_VERSION
mv $CS_VERSION/ bin/
chmod +x ~/bin/code-server
mkdir -p ~/data
cd /etc/systemd/system/

