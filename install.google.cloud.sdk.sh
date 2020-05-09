#!/bin/bash
GOOGLE_SDK="google-cloud-sdk-291.0.0-linux-x86_64.tar.gz"

# create dev/git and clone projects from git
cd /home/khanh_doth/dev

rm -r cloud-sdk
mkdir cloud-sdk
cd cloud-sdk
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$GOOGLE_SDK
tar -xvzf $GOOGLE_SDK
rm $GOOGLE_SDK
yes Y | sh google-cloud-sdk/install.sh
./google-cloud-sdk/bin/gcloud init