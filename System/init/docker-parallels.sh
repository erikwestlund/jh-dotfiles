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
mysql -u root -psecret -e "CREATE USER 'root'@'%' IDENTIFIED BY 'secret'";
mysql -u root -psecret -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';"

#copy mysqld.cnf from services-vm/mysql to /etc/mysql/conf.d/mysqld.cnf
# run:
service mysql restart
