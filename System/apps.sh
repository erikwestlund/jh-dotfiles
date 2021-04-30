#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# path
export PATH="/usr/local/bin:$PATH"

# drivers -- includes sonos
brew tap homebrew/cask-drivers

# install brew casks
brew install 1password
brew install google-chrome
brew install spotify
brew install sonos
brew install microsoft-word
brew install microsoft-excel
brew install microsoft-powerpoint
brew install zotero
brew install alfred
brew install freedom
brew install geekbench
brew install caffeine
brew install slack
brew install istat-menus
