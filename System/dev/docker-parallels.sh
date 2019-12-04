#!/bin/sh

# Download docker-toolbox
https://github.com/docker/toolbox

# Install Parallels Desktop Pro, license
brew install docker-machine-parallels

docker-machine create --driver parallels --parallels-disk-size "51200" --parallels-memory 4096 --parallels-cpu-count 2 Docker
