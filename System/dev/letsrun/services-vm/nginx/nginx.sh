#!/bin/sh
apt install -y nginx

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