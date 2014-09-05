#!/usr/bin/env bash

if [ ! "$(ls -A /var/lib/mysql)" ]; then
  /usr/bin/mysql_install_db

  /etc/init.d/mysql start

  PASSWORD=$([ "${MYSQL_PASSWORD}" ] && echo "${MYSQL_PASSWORD}" || echo 'root')

  /usr/bin/mysqladmin -u root password "${PASSWORD}"

  /etc/init.d/mysql stop
fi

/usr/bin/supervisord
