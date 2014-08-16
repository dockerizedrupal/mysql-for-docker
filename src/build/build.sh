#!/bin/sh

apt-get update
apt-get -y install mysql-server

mysql_install_db

mysqladmin -u root password "root"