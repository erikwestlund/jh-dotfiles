#!/usr/bin/env bash

# make sure secrets are already gathered.

# get code
mkdir -p $HOME/code/letsrun
cd $HOME/code/letsrun
git init
git remote add origin https://github.com/letsrun/letsrun.com
git fetch
git reset --mixed
git checkout dev

# launch docker
./develop up -d

composer install
npm install

# shut down docker
./develop down