#!/bin/bash
echo "Restore postgres databases"

cd /home/khanh_doth
rm -R dbdata
tar -zxvf /home/khanh_doth/dev/git/u-cloud/postgres/dbdata.tar.gz