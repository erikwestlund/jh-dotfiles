#!/usr/bin/env bash

# Run the bootstrap.sh file
# Run the bundle first.

# set permissions for set up scripts and binaries
chmod +x $HOME/System/*.sh

# ssh
mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
touch ~/.ssh/known_hosts
touch ~/.ssh/config
source $HOME/System/dev/ssh-permissions.sh


# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# iterm themes
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git dev/iterm-themes
git clone https://github.com/jsit/night-owl-iterm2-theme


# install node & npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install v16
nvm install v15
# nvm install v13 -- install this using a rosetta console


# Laravel valet
composer global require laravel/valet
valet install

# Statamic
composer global require statamic/cli



# set up R Java
R CMD javareconf


# tell user
echo "Now is a good time to set up rclone using rclone.conf, to bootstrap the secrets."

# configure php
sed -i'' -e 's/memory_limit = 128M/memory_limit = 256M/g' /opt/homebrew/etc/php/8.1/php.ini
sed -i'' -e 's/post_max_size = 8M/post_max_size = 1024M/g' /opt/homebrew/etc/php/8.1/php.ini
sed -i'' -e 's/upload_max_filesize = 2M/upload_max_filesize = 102M4/g' /opt/homebrew/etc/php/8.1/php.ini


