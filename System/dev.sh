#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# get iterm themes
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git dev/iterm-themes
git clone https://github.com/jsit/night-owl-iterm2-theme
# path
export PATH="/usr/local/bin:$PATH"

# install brew packages
brew install r
brew install zulu15
brew install awscli
brew install pipenv
brew install composer
brew install jq
brew install jpegoptim
brew install optipng
brew install pngquant
brew install svgo
brew install gifsicle

# install node & npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install v15
# nvm install v13 -- install this using a rosetta console

# valet
composer global require laravel/valet
valet install

# redis-cli; we'll use dbnging for redis installs
brew tap ringohub/redis-cli
brew install redis-cli

# laravel utils
brew install ray
brew install tinkerwell

# install brew casks
brew install jetbrains-toolbox
brew install nova
brew install dash
brew install github
# brew install rstudio: Get daily build for now https://dailies.rstudio.com/
brew install tableplus
brew install dbngin
brew install mactex

# r: set up java
R CMD javareconf

