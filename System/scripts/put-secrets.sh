#!/usr/bin/env bash

rclone copy /etc/hosts config:/erik-config/
rclone sync ~/.ssh/ config:/erik-config/ssh/
rclone sync ~/.aws/ config:/erik-config/aws/

# letsrun
rclone copy ~/code/letsrun/auth.json config:/erik-config/letsrun/
rclone copy ~/code/letsrun/.npmrc config:/erik-config/letsrun/
rclone copy ~/code/letsrun/.env config:/erik-config/letsrun/

# pequod
rclone copy ~/code/pequod/auth.json config:/erik-config/pequod/
rclone copy ~/code/pequod/.env config:/erik-config/pequod/
