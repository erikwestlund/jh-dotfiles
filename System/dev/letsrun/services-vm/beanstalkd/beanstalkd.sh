#!/bin/sh

apt install -y beanstalkd

mv /etc/default/beanstalkd /etc/default/beanstalkd-initial
nano /etc/default/beanstalkd

#run:
echo "BEANSTALKD_LISTEN_ADDR=0.0.0.0" > /etc/default/beanstalkd
echo "BEANSTALKD_LISTEN_PORT=11300" >> /etc/default/beanstalkd

service beanstalkd restart