#!/bin/sh

add-apt-repository -y ppa:chris-lea/redis-server

# Update and upgrade
apt update
apt -y upgrade

# install redis server
apt install -y redis-server redis-tools

sed -i -e 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
sed -i -e 's/# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/g' /etc/redis/redis.conf
sed -i -e 's/# maxmemory <bytes>/maxmemory 1750mb/g' /etc/redis/redis.conf
sed -i -e 's/stop-writes-on-bgsave-error yes/stop-writes-on-bgsave-error no/g' /etc/redis/redis.conf

service redis-server restart


sudo systemctl enable redis-server