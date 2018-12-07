#!/usr/bin/env bash

# make sure secrets are already gathered.

# get code
rm -rf $HOME/code/letsrun-wp
git clone https://github.com/erikwestlund/docker-wp.git letsrun-wp
cd $HOME/code/letsrun-wp

./develop sync
./develop up
./develop db_seed
./develop down
