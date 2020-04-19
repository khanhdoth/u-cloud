#!/bin/bash
echo "Backup postgres databases"

cd /home/khanh_doth
tar -zcvf /home/khanh_doth/dev/git/u-cloud/postgres/dbdata.tar.gz dbdata/