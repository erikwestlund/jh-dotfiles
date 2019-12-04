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

# shut down docker
./develop down