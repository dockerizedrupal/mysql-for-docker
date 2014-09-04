#!/usr/bin/env bash

if [ ! "$(ls -A /var/lib/mysql)" ]; then
  /usr/bin/mysql_install_db

  /etc/init.d/mysql start

  echo "UPDATE mysql.user SET password = PASSWORD('root') WHERE user = 'root';" | /usr/bin/mysql
fi

#if [ -n "${MYSQL_PASSWORD}" ]; then
#  /etc/init.d/mysql start && echo \"UPDATE mysql.user SET password = PASSWORD(\'root\') WHERE user = \'root\';\" | mysql
#fi

/usr/bin/supervisord
