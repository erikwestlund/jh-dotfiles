#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Zsh
brew install zsh

# Install `wget`
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install pkg-config

# PHP
brew tap shivammathur/php
brew install php@7.4

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# install brew fonts
brew tap homebrew/cask-fonts
brew install font-fira-code
brew install font-source-code-pro
brew install font-lato

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# vscode
brew install visual-studio-code
mkdir -p ~/Library/Application\ Support/Code/User/
ln -fs $HOME/System/init/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -fs $HOME/System/init/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -fs $HOME/System/init/vscode/snippets/ ~/Library/Application\ Support/Code/User/snippets

#htop
brew install htop

# set permissions for set up scripts and binaries
chmod +x $HOME/System/*.sh

# ssh
mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
touch ~/.ssh/known_hosts
touch ~/.ssh/config
source $HOME/System/dev/ssh-permissions.sh

# install iterm2
brew cask install iterm2

# install sublime text
brew cask install sublime-text

# Remove outdated versions from the cellar.
brew cleanup


# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"