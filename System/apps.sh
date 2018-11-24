#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# path
export PATH="/usr/local/bin:$PATH"

# install brew casks
brew cask install 1password
brew cask install google-chrome
brew cask install superduper
brew cask install dropbox
brew cask install spotify
brew cask install microsoft-office
brew cask install clover-configurator
brew cask install parallels-access
brew cask install zotero
brew cask install alfred
brew cask install dash
brew cask install freedom
brew cask install geekbench

