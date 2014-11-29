#!/usr/bin/env bash

PASSWORD=$([ "${PASSWORD}" ] && echo "${PASSWORD}" || echo "root")

DATADIR="/mysqld/data"

if [ ! "$(ls -A ${DATADIR})" ]; then
  /usr/bin/mysql_install_db --user=mysql > /dev/null 2>&1

  /usr/bin/mysqld_safe > /dev/null 2>&1 &

  # wait for mysql server to start (max 30 seconds)
  TIMEOUT=30

  while ! /usr/bin/mysqladmin -u root status > /dev/null 2>&1
  do
    TIMEOUT=$(($TIMEOUT - 1))

    if [ $TIMEOUT -eq 0 ]; then
      exit 1
    fi

    sleep 1
  done

  mysql -u root -e  "CREATE USER 'root'@'%' IDENTIFIED BY '${PASSWORD}';"
  mysql -u root -e  "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

  /usr/bin/mysqladmin -u root password "${PASSWORD}"

  /usr/bin/mysqladmin -u root shutdown
fi

chown -R mysql.mysql "${DATADIR}"

/usr/bin/supervisord
