#!/usr/bin/env bash

# make sure secrets are already gathered.

# get code
mkdir -p $HOME/code/letsrun
cd $HOME/code/letsrun
git init
git remote add origin https://git-codecommit.us-east-1.amazonaws.com/v1/repos/LetsRun.com
git fetch
git reset --mixed
git checkout dev

# launch docker
./develop up -d

composer install
npm install

# set up db
./develop exec app mysql --host="mysql" --user="root" --password="secret" -e "CREATE DATABASE db17058c";
./develop exec app mysql --host="mysql" --user="root" --password="secret" -e "CREATE DATABASE letsrun";
./develop exec app mysql --host="mysql" --user="root" --password="secret" -e "CREATE DATABASE letsrun_com";
./develop exec app mysql --host="mysql" --user="root" --password="secret" -e "CREATE DATABASE letsrun_testing";
./develop exec app mysql --host="mysql" --user="root" --password="secret" -e "CREATE DATABASE letsrun_browser_testing";
./develop exec app mysql --host="mysql" --user="root" --password="secret" letsrun_com -e "source /var/www/html/database/seeds/data/letsrun_com_schema.sql";
./develop art db:seed_from_prod
./develop art db:create_test_db

# shut down docker
./develop down