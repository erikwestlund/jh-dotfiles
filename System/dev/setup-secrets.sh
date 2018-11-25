#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


DIR=$HOME/Desktop
SECRETSDIR=$DIR/secrets

rm -rf $SECRETSDIR
mkdir -p $SECRETSDIR

unzip $DIR/secrets.zip -d $SECRETSDIR

# etc hosts
sudo rm -f /etc/hosts.bak 
sudo cp /etc/hosts /etc/hosts.bak
sudo rm -f /etc/hosts
sudo cp $SECRETSDIR/etc/hosts /etc/hosts

# ssh
rsync -avh --exclude=.DS_store $SECRETSDIR/ssh/ $HOME/.ssh/
source ssh-permissions.sh

# aws
rsync -avh --exclude=.DS_store $SECRETSDIR/aws/ $HOME/.aws/

# sequel pro
rsync -avh --exclude=.DS_store $SECRETSDIR/sequel-pro/ $HOME/Library/Application\ Support/Sequel\ Pro/Data/

# code
rsync -avh --exclude=.DS_store $SECRETSDIR/code/ $HOME/code/

rm -rf $SECRETSDIR