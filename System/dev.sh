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
brew install awscli
brew install pipenv
brew install redis
brew install composer
brew install jq

# install node & npm
brew install nvm
mkdir ~/.nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install --lts
nvm use default
nvm install --latest-npm

# install brew casks
brew cask install jetbrains-toolbox
brew cask install coda
brew cask install dash
brew cask install github
brew cask install rstudio
brew cask install tableplus
brew cask install mactex

