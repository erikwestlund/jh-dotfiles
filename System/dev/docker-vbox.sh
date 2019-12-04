#!/bin/sh

# Install Virtualbox
brew cask install virtualbox

# Download docker-toolbox
https://github.com/docker/toolbox

# Set up
docker-machine create --driver virtualbox --virtualbox-no-vtx-check --virtualbox-disk-size "51200" --virtualbox-memory 4096 --virtualbox-cpu-count 2  --virtualbox-hostonly-cidr "10.10.10.1/24" Docker

# Set up virtualbox image.  Do networking, host mode
