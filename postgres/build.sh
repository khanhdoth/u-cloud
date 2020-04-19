#!/bin/bash
echo "Build postgres container"

# delete running container
docker rm -f my-running-postgres

# restore databases
sh /home/khanh_doth/dev/git/u-cloud/postgres/database.restore.sh

# create new container 
docker run -u 0 -dit --name my-running-postgres -v /home/khanh_doth/dbdata:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres

ufw allow 5432