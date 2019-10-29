#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# temporary secrets location
SAVEDIR=$HOME/Desktop
TEMPDIR=$SAVEDIR/secrets
TEMPZIP=$SAVEDIR/secrets.zip

rm -rf $TEMPDIR
rm -f $TEMPZIP

mkdir -p $TEMPDIR

# etc hosts
mkdir -p $TEMPDIR/etc/
cp /etc/hosts $TEMPDIR/etc/

#ssh
mkdir -p $TEMPDIR/ssh/
rsync -avh ~/.ssh/ $TEMPDIR/ssh/

# aws
mkdir -p $TEMPDIR/aws/
rsync --exclude "known_hosts" --exclude "known_hosts" --exclude ".DS_Store" -avh ~/.aws/ $TEMPDIR/aws/

# sequel pro
mkdir -p $TEMPDIR/sequel-pro
cp $HOME/Library/Application\ Support/Sequel\ Pro/Data/Favorites.plist $TEMPDIR/sequel-pro/

## code secrets
CODEDIR=$HOME/code
TEMPCODEDIR=$TEMPDIR/code

mkdir -p $TEMPCODEDIR

# letsrun
LETSRUNDIR=$CODEDIR/letsrun
TEMPLETSRUNDIR=$TEMPCODEDIR/letsrun

if [ -d $LETSRUNDIR ]; then
    mkdir -p $TEMPLETSRUNDIR
    mkdir -p $TEMPLETSRUNDIR/database/seeds/data/
    cp $LETSRUNDIR/.env $TEMPLETSRUNDIR
    cp $LETSRUNDIR/.env-dev-server $TEMPLETSRUNDIR
    cp $LETSRUNDIR/.env-production-server $TEMPLETSRUNDIR
    cp $LETSRUNDIR/.env-worker-server $TEMPLETSRUNDIR
    cp $LETSRUNDIR/.env.dusk.local $TEMPLETSRUNDIR    
    cp $LETSRUNDIR/.npmrc $TEMPLETSRUNDIR
    cp $LETSRUNDIR/auth.json $TEMPLETSRUNDIR
    cp $LETSRUNDIR/database/seeds/data/letsrun_com_schema.sql $TEMPLETSRUNDIR/database/seeds/data/
fi

# blog
BLOGDIR=$CODEDIR/blog
TEMPBLOGDIR=$TEMPCODEDIR/blog

if [ -d $BLOGDIR ]; then
    mkdir -p $TEMPBLOGDIR
    mkdir -p $TEMPBLOGDIR/app    
    cp $BLOGDIR/.docker_env $TEMPBLOGDIR
    cp $BLOGDIR/app/.env $TEMPBLOGDIR/app
    cp $BLOGDIR/app/.npmrc $TEMPBLOGDIR/app
fi


# zuhanden
ZUHANDENDIR=$CODEDIR/zuhanden
TEMPZUHANDENDIR=$TEMPCODEDIR/zuhanden

if [ -d $ZUHANDENDIR ]; then
    mkdir -p $TEMPZUHANDENDIR
    cp $ZUHANDENDIR/.env $TEMPZUHANDENDIR
    cp $ZUHANDENDIR/.npmrc $TEMPZUHANDENDIR
fi

cd $TEMPDIR
zip -r $TEMPZIP ./*

rm -rf $TEMPDIR
