#!/bin/bash
echo "Build postgres container"

# delete running container
docker rm -f my-running-postgres

# create required folders
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_commit_ts
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_dynshmem
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_replslot
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_serial
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_snapshots
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_stat
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_stat_tmp
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_tblspc
#mkdir /home/khanh_doth/dev/git/u-cloud/postgres/data/pg_twophase

# create new container 
docker run -u 0 -dit --name my-running-postgres -v /home/khanh_doth/dev/git/u-cloud/postgres/data:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres

ufw allow 5432