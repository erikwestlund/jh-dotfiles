#!/usr/bin/env bash

# make sure secrets are already gathered.

# get code
rm -rf $HOME/code/letsrun-forum
cd $HOME/code
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/docker-letsrun-forum letsrun-forum
cd $HOME/code/letsrun-forum

./develop sync
./develop up -d
./develop db_seed
./develop down
