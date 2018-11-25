#!/usr/bin/env bash

cd $HOME/code/letsrun
git init
git remote add origin https://git-codecommit.us-east-1.amazonaws.com/v1/repos/LetsRun.com
git fetch
git reset --hard
git checkout dev

docker-compose up -d
composer install
npm install
docker-compose down