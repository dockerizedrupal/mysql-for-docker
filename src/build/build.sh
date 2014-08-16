#!/bin/sh

apt-get update
apt-get -y install mysql-server

mysql_install_db

/usr/bin/mysqld_safe &

mysqladmin -u root password "root"