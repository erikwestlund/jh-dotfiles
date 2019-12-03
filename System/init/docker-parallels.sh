#!/bin/sh

# Install Parallels Desktop Pro, license
brew install docker-machine-parallels

docker-machine create --driver parallels --parallels-disk-size "51200" --parallels-memory 4096 --parallels-cpu-count 2 Docker


curl http://releases.ubuntu.com/18.04/ubuntu-18.04.3-live-server-amd64.iso -o ~/Downloads/ubuntu-18.04.3-live-server-amd64.iso

# Configure by hand
# 8gb user: dev password: secret, travel mode @30%, quit automatically when connected to power

sudo su
apt update
apt upgrade

cd

wget https://repo.percona.com/apt/percona-release_0.1-6.$(lsb_release -sc)_all.deb
dpkg -i percona-release_0.1-6.$(lsb_release -sc)_all.deb
apt update

apt -y install  percona-server-server-5.7 percona-server-client-5.7 percona-toolkit
mysql -u root -psecret -e "create database letsrun;"
mysql -u root -psecret -e "create database letsrun_com;"
mysql -u root -psecret -e "create database letsrun_testing;"
mysql -u root -psecret -e "create database letsrun_browser_testing;"
mysql -u root -psecret -e "create database letsrun_com_testing;"
mysql -u root -psecret -e "create database letsrun_com_browser_testing;"
mysql -u root -psecret -e "create database wordpress;"
mysql -u root -psecret -e "create database db17058c;"
mysql -u root -psecret -e "create database dbdii;"
mysql -u root -psecret -e "create database dbdiii;"
mysql -u root -psecret -e "create database shoes;"
mysql -u root -psecret -e "CREATE USER 'root'@'%' IDENTIFIED BY 'secret'";
mysql -u root -psecret -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';"

# Install docker
apt install -y docker.io


# Install nginx
# Install supervisor using code in services-vm/supervisor/install.sh
# Copy supervisord.conf to /etc/supervisor/supervisord.conf
# Install beanstalkd using services-vm/beanstalkd
# Install beanstalkd admin using services-vm/beanstalkd-admin
# Install geoip using services/geoip
# Install redis

#copy mysqld.cnf from services-vm/mysql to /etc/mysql/conf.d/mysqld.cnf
# run:
service mysql restart

# on computer, pull down dbs and load
cd ~/Desktop
aws s3 cp s3://letsrun-backup/database/daily/sql/letsrun.sql.gz ~/Downloads/letsrun.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/letsrun_com.sql.gz ~/Downloads/letsrun_com.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/wordpress.sql.gz ~/Downloads/wordpress.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/shoes.sql.gz ~/Downloads/shoes.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/dbdii.sql.gz ~/Downloads/dbdii.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/dbdiii.sql.gz ~/Downloads/dbdiii.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/db17058c.sql.gz ~/Downloads/db17058c.sql.gz

# Make sure aws security group is set up; pull down schema of letsrun_com for test DBs
mysqldump --column-statistics=0 --no-data -h letsrun-dbserver -u letsrun-app -p letsrun_com > ~/Downloads/letsrun_com_testing.sql
cp ~/Downloads/letsrun_com_testing.sql  ~/Downloads/letsrun_com_browser_testing.sql

# load test Dbs for forum
pv ~/Downloads/letsrun_com_testing.sql | mysql -h mysql -u root -psecret letsrun_com_testing
pv ~/Downloads/letsrun_com_browser_testing.sql | mysql -h mysql -u root -psecret letsrun_com_browser_testing

# load all data
pv ~/Downloads/letsrun.sql.gz | gunzip | mysql -h mysql -u root -psecret letsrun
pv ~/Downloads/letsrun_com.sql.gz | gunzip | mysql -h mysql -u root -psecret letsrun_com
pv ~/Downloads/wordpress.sql.gz | gunzip | mysql -h mysql -u root -psecret wordpress
pv ~/Downloads/shoes.sql.gz | gunzip | mysql -h mysql -u root -psecret shoes
pv ~/Downloads/dbdii.sql.gz | gunzip | mysql -h mysql -u root -psecret dbdii
pv ~/Downloads/dbdiii.sql.gz | gunzip | mysql -h mysql -u root -psecret dbdiii
pv ~/Downloads/db17058c.sql.gz | gunzip | mysql -h mysql -u root -psecret db17058c

