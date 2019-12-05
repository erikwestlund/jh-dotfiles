#!/bin/sh

wget https://repo.percona.com/apt/percona-release_0.1-6.$(lsb_release -sc)_all.deb
dpkg -i percona-release_0.1-6.$(lsb_release -sc)_all.deb
apt update

apt -y install  percona-server-server-5.7 percona-server-client-5.7 percona-toolkit

#copy mysqld.cnf from services-vm/mysql to /etc/mysql/conf.d/mysqld.cnf
# run:
service mysql restart

mysql -u root -psecret -e "create database letsrun;"
mysql -u root -psecret -e "create database letsrun_com;"
mysql -u root -psecret -e "create database wordpress;"
mysql -u root -psecret -e "create database db17058c;"
mysql -u root -psecret -e "create database dbdii;"
mysql -u root -psecret -e "create database dbdiii;"
mysql -u root -psecret -e "create database shoes;"
mysql -u root -psecret -e "CREATE USER 'root'@'%' IDENTIFIED BY 'secret'";
mysql -u root -psecret -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';"

# create test database which runs in docker
mysql -h testdb -u root -psecret -e "create database letsrun;"
mysql -h testdb -u root -psecret -e "create database letsrun_com;"
