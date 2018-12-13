#!/usr/bin/env bash

# make sure secrets are already gathered.

# get code
rm -rf $HOME/code/letsrun-wp
cd $HOME/code
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/docker-letsrun-wp letsrun-wp
cd $HOME/code/letsrun-wp

./develop sync
./develop up -d
./develop db_seed
./develop down
