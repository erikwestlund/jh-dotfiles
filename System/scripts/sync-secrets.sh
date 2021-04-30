#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

rclone copy config:/erik-config/hosts /etc/
rclone copy config:/erik-config/rclone/rclone.conf ~/.config/rclone/
rclone sync config:/erik-config/ssh/ ~/.ssh/
rclone sync config:/erik-config/aws/ ~/.aws/

# letsrun
rclone copy config:/erik-config/letsrun/auth.json ~/code/letsrun/
rclone copy config:/erik-config/letsrun/.npmrc ~/code/letsrun/
rclone copy config:/erik-config/letsrun/.env ~/code/letsrun/

# pequod
rclone copy config:/erik-config/pequod/auth.json ~/code/pequod/
rclone copy config:/erik-config/pequod/.env ~/code/pequod/
