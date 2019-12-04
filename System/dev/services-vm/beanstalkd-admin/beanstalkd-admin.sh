#!/bin/bash

# binary
mkdir -p /opt/beanstalk-aurora
cd /opt/beanstalk-aurora
wget https://github.com/xuri/aurora/releases/download/2.2/aurora_linux_amd64_v2.2.tar.gz
tar -xvzf /opt/beanstalk-aurora/aurora_linux_amd64_v2.2.tar.gz

# app
touch /var/log/aurora-beanstalk.log
# copy beanstalk-aurora.conf using:
nano /etc/supervisor/conf.d/beanstalk-aurora.conf

supervisorctl reread
supervisorctl update
supervisorctl start beanstalk-aurora:*

# nginx

NGINX=$(cat <<-END

server {
    listen 80;
    listen [::]:80;

    server_name beanstalk.letsrun.test;

    access_log /var/log/nginx/beanstalk.letsrun.test.access.log;
    error_log /var/log/nginx/beanstalk.letsrun.test.error.log;

    location / {
        proxy_set_header   X-Forwarded-For \$remote_addr;
        proxy_set_header   Host \$http_host;
        proxy_pass         http://127.0.0.1:3000;
    }
}
END
)

echo "$NGINX" > /etc/nginx/sites-available/beanstalk.letsrun.test

rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
ln -s /etc/nginx/sites-available/beanstalk.letsrun.test /etc/nginx/sites-enabled/beanstalk.letsrun.test


service nginx restart