
#!/bin/sh
docker run --restart=always -p 8080:8080 -d fiorix/freegeoip

GEOIP_NGINX=$(cat <<-END

server {
    listen 80;
    listen [::]:80;

    server_name geoip.letsrun.test;

    access_log /var/log/nginx/freegeoip.letsrun.test.access.log;
    error_log /var/log/nginx/freegeoip.letsrun.test.error.log;

    location / {
        proxy_set_header   X-Forwarded-For \$remote_addr;
        proxy_set_header   Host \$http_host;
        proxy_pass         http://127.0.0.1:8080;
    }
}
END
)

echo "$GEOIP_NGINX" > /etc/nginx/sites-available/geoip.letsrun.test

ln -s /etc/nginx/sites-available/geoip.letsrun.test /etc/nginx/sites-enabled/geoip.letsrun.test

service nginx restart
