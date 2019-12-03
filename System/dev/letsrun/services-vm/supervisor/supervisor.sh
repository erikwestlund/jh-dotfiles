#!/bin/sh
apt -y install supervisor

groupadd supervisor
usermod -a -G supervisor dev

mv /etc/supervisor/supervisord.conf /etc/supervisor/supervisord.conf-init

# Copy supervisord.conf, then run

touch /var/run/supervisor.sock
chmod 777 /var/run/supervisor.sock

service supervisor restart