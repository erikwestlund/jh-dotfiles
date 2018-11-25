#!/usr/bin/env bash

cd $HOME/code/blog
git init
git remote add origin https://github.com/erikwestlund/blog.git
git fetch
git reset --mixed
git checkout master

./develop build
docker-compose up -d
./develop db upgrade
docker-compose down