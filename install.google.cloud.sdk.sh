#!/bin/bash

# create dev/git and clone projects from git
cd /home/khanh_doth/dev

rm -r cloud-sdk
mkdir cloud-sdk
cd cloud-sdk

wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-291.0.0-linux-x86_64.tar.gz
tar -xvzf google-cloud-sdk-291.0.0-linux-x86_64.tar.gz