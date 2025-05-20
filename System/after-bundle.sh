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

# rstudio
bash ~/code/dotfiles/System/dev/rstudio/install-settings.sh

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# iterm themes
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git dev/iterm-themes
git clone https://github.com/jsit/night-owl-iterm2-theme


# set up R Java
R CMD javareconf

# Tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
