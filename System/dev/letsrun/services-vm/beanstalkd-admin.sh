#!/bin/bash

# binary
mkdir -p /opt/beanstalk-aurora
cd /opt/beanstalk-aurora
wget https://github.com/xuri/aurora/releases/download/2.2/aurora_linux_amd64_v2.2.tar.gz
tar -xvzf /opt/beanstalk-aurora/aurora_linux_amd64_v2.2.tar.gz

# supervisor
apt -y install supervisor

groupadd supervisor
usermod -a -G supervisor ubuntu

mv /etc/supervisor/supervisord.conf /etc/supervisor/supervisord.conf-init

# Copy supervisord.conf to /etc/supervisor/supervisord.conf

touch /var/run/supervisor.sock
chmod 777 /var/run/supervisor.sock

service supervisor restart

# app
touch /var/log/aurora-beanstalk.log
cp /opt/letsrun-provision/letsrun/config/supervisor/beanstalk-aurora.conf /etc/supervisor/conf.d/beanstalk-aurora.conf

supervisorctl reread
supervisorctl update
supervisorctl start beanstalk-aurora:*

# nginx
add-apt-repository -y ppa:nginx/development

apt install -y nginx

echo 'letsrun:$apr1$n/51L6Pe$JTt0O4DATIBRvNzE4nss3/' > /etc/nginx/restricted_users

NGINX=$(cat <<-END

server {
    listen 80;
    listen [::]:80;

    server_name beanstalk.letsrun.com;

    auth_basic "Restricted";
    auth_basic_user_file /etc/nginx/restricted_users;

    access_log /var/log/nginx/beanstalk.letsrun.com.access.log;
    error_log /var/log/nginx/beanstalk.letsrun.com.error.log;

    location / {
        proxy_set_header   X-Forwarded-For \$remote_addr;
        proxy_set_header   Host \$http_host;
        proxy_pass         http://127.0.0.1:3000;
    }
}
END
)

echo "$NGINX" > /etc/nginx/sites-available/beanstalk.letsrun.com

rm /etc/nginx/sites-available/default
ln -s /etc/nginx/sites-available/beanstalk.letsrun.com /etc/nginx/sites-enabled/beanstalk.letsrun.com


service nginx restart