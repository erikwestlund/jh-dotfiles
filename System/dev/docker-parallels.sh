#!/bin/sh

# Download docker-toolbox
https://github.com/docker/toolbox

# Install Parallels Desktop Pro, license
brew install docker-machine-parallels

# Install NFS for speed
brew install docker-machine-nfs

# Run this mount
docker-machine-nfs Docker \
    --mount-opts="noacl,async,nolock,vers=3,udp,noatime,actimeo=2" \
    --shared-folder="/Users/erik/code"

docker-machine create --driver parallels --parallels-disk-size "51200" --parallels-memory 4096 --parallels-cpu-count 2 Docker
