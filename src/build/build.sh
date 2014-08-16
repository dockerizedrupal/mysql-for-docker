#!/bin/sh

apt-get update
apt-get -y install mysql-server

mysql_install_db

/usr/bin/mysqld_safe &

RET=1

while [[ RET -ne 0 ]]; do
    sleep 5

    mysql -uroot -e "status"

    RET=$?
done

mysqladmin -u root password "root"