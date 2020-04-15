#!/bin/bash

# export DEBIAN_FRONTEND=noninteractive
apt update
apt -y install docker.io
cd /home/khanhdoth
mkdir dev
cd dev
mkdir git
cd git
git clone https://github.com/khanhdoth/my_hello
cd my_hello
sh dev.build.sh
