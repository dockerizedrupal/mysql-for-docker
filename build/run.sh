#!/usr/bin/env bash

#if [ -n "${MYSQL_PASSWORD}" ]; then
#  /etc/init.d/mysql start && echo \"UPDATE mysql.user SET password = PASSWORD(\'root\') WHERE user = \'root\';\" | mysql
#fi

/usr/bin/supervisord
