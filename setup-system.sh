#!/usr/bin/env bash

# Steps:
# 1. Run "source bootstrap.sh"
# 2. Run "source brew.sh" to install all the brew defaults
# 3. Run this file: "source setup-system.sh"
# 4. Don't forget to add your secrets:
# -- .env files
# -- AWS config keys
# -- /etc/hosts

# path
export PATH="/usr/local/bin:$PATH"

#oh my zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Git Setup
GIT_AUTHOR_NAME="Erik Westlund"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="edbwestlund@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# install brew packages
brew tap homebrew/science
brew install r
brew install zsh
brew install awscli
brew install pipenv
brew install redis
brew install composer

# install brew casks
brew cask install google-chrome
brew cask install 1password
brew cask install superduper
brew cask install visual-studio-code
brew cask install sublime-text
brew bask install docker
brew cask install dropbox
brew cask install jetbrains-toolbox
brew cask install spotify
brew cask install microsoft-office
brew cask install iterm2
brew cask install sequel-pro
brew cask install mactex
brew cask install coda
brew cask install clover-configurator
brew cask install parallels-access
brew cask install zotero
brew cask install alfred
brew cask install dash
brew cask install freedom
brew cask install geekbench
brew cask install github
brew cask install logitech-options

# install brew fonts
brew tap caskroom/fonts

brew cask install font-fira-code
brew cask install font-source-code-pro
brew cask install font-lato
