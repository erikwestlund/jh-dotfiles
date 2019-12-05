#!/bin/sh

# on host computer, pull down dbs and load
cd ~/Desktop
aws s3 cp s3://letsrun-backup/database/daily/sql/letsrun.sql.gz ~/Downloads/letsrun.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/letsrun_com.sql.gz ~/Downloads/letsrun_com.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/wordpress.sql.gz ~/Downloads/wordpress.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/shoes.sql.gz ~/Downloads/shoes.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/dbdii.sql.gz ~/Downloads/dbdii.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/dbdiii.sql.gz ~/Downloads/dbdiii.sql.gz
aws s3 cp s3://letsrun-backup/database/daily/sql/db17058c.sql.gz ~/Downloads/db17058c.sql.gz

# load all data
pv ~/Downloads/letsrun.sql.gz | gunzip | mysql -h mysql -u root -psecret letsrun
pv ~/Downloads/letsrun_com.sql.gz | gunzip | mysql -h mysql -u root -psecret letsrun_com
pv ~/Downloads/wordpress.sql.gz | gunzip | mysql -h mysql -u root -psecret wordpress
pv ~/Downloads/shoes.sql.gz | gunzip | mysql -h mysql -u root -psecret shoes
pv ~/Downloads/dbdii.sql.gz | gunzip | mysql -h mysql -u root -psecret dbdii
pv ~/Downloads/dbdiii.sql.gz | gunzip | mysql -h mysql -u root -psecret dbdiii
pv ~/Downloads/db17058c.sql.gz | gunzip | mysql -h mysql -u root -psecret db17058c

# Seed test databases using artisan command