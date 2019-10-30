#!/usr/bin/env bash

mkdir -p $HOME/code/zuhanden
cd $HOME/code/zuhanden
git init
git remote add origin https://github.com/erikwestlund/zuhanden.git
git fetch
git reset --mixed
git checkout master

pipenv install
pipenv shell
craft install
docker-compose build