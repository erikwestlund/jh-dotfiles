#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# get iterm themes
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git dev/iterm-themes

# path
export PATH="/usr/local/bin:$PATH"

# install brew packages
brew install r
brew install git
brew install awscli
brew install pipenv
brew install redis
brew install composer
brew install node
brew install jq
brew install php@7.3

# install brew casks
brew cask install sublime-text
brew cask install docker
brew cask install jetbrains-toolbox
brew cask install iterm2
brew cask install sequel-pro
brew cask install mactex
brew cask install coda
brew cask install dash
brew cask install github
brew cask install rstudio

# install brew fonts
brew tap caskroom/fonts

brew cask install font-fira-code
brew cask install font-source-code-pro
brew cask install font-lato
