#!/usr/bin/env bash

# path
export PATH="/usr/local/bin:$PATH"

#oh my zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# show extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

killall Finder

# Git Setup
GIT_AUTHOR_NAME="Erik Westlund"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="edbwestlund@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

source erik-brew.sh
source erik-brew-cask.sh
source erik-brew-cask-fonts.sh