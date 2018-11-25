#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


DIR=$HOME/Desktop
SECRETSDIR=$DIR/secrets
cd $DIR
unzip $DIR/secrets.zip


sudo rm -f /etc/hosts.bak 
sudo cp /etc/hosts /etc/hosts.bak
sudo rm -f /etc/hosts
sudo cp $SECRETSDIR/etc/hosts /etc/hosts

#rm -rf ~/.secrets/