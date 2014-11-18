#!/usr/bin/env bash

if [ ! "$(ls -A /mysqld/data)" ]; then
  /usr/bin/mysql_install_db

  /etc/init.d/mysql start

  PASSWORD=$([ "${MYSQL_PASSWORD}" ] && echo "${MYSQL_PASSWORD}" || echo "root")

  echo "CREATE USER 'root'@'%' IDENTIFIED BY '${PASSWORD}';" | mysql
  echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" | mysql

  /usr/bin/mysqladmin -u root password "${PASSWORD}"

  /etc/init.d/mysql stop
fi

/usr/bin/supervisord
