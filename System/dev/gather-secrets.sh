#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# temporary secrets location
SAVEDIR=$HOME/Desktop
TEMPDIR=$SAVEDIR/secrets

mkdir -p $TEMPDIR

# etc hosts
mkdir -p $TEMPDIR/etc/
cp /etc/hosts $TEMPDIR/etc/

#ssh
mkdir -p $TEMPDIR/ssh/
rsync -avh ~/.ssh/ $TEMPDIR/ssh/

# aws
mkdir -p $TEMPDIR/aws/
rsync -avh ~/.aws/ $TEMPDIR/aws/

# code secrets
CODEDIR=$HOME/code
TEMPCODEDIR=$TEMPDIR/code

mkdir -p $TEMPCODEDIR

BLOGDIR=$CODEDIR/blog
TEMPBLOGDIR=$TEMPCODEDIR/blog

if [ -f $BLOGDIR ]; then
    mkdir -p $TEMPBLOGDIR
    cp $BLOGDIR/.docker_env $TEMPCODEDIR
fi

zip -r $SAVEDIR/secrets.zip $TEMPDIR
