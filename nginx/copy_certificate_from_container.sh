#!/bin/bash
rm -r /home/khanh_doth/dev/git/u-cloud/nginx/letsencrypt
docker cp my-running-nginx:/etc/letsencrypt/archive/. /home/khanh_doth/dev/git/u-cloud/nginx/letsencrypt