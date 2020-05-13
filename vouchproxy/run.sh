#!/bin/bash
echo "Run Vouch Proxy container"

# delete running container
docker rm -f my-running-vouchproxy

cd /home/khanh_doth
docker run -dit --restart always --name my-running-vouchproxy \
    -p 9090:9090 \
    -v /home/khanh_doth/dev/git/u-cloud/vouchproxy/config:/config \
    voucher/vouch-proxy    
