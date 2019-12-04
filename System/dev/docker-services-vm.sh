#!/bin/sh

curl http://releases.ubuntu.com/18.04/ubuntu-18.04.3-live-server-amd64.iso -o ~/Downloads/ubuntu-18.04.3-live-server-amd64.iso

# Configure by hand
# 12gb user: dev password: secret
# On virtualbox, make sure network is in bridge adapter mode to allow access in and network access out

sudo su
apt update
apt upgrade
apt install -y docker.io

# Install mysql (percona) using install.sh
# Install nginx
# Install supervisor using code in services-vm/supervisor/install.sh
# Install beanstalkd using services-vm/beanstalkd
# Install beanstalkd admin using services-vm/beanstalkd-admin
# Install geoip using services/geoip
# Install redis
# Seed database