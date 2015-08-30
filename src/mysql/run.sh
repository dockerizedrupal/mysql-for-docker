#!/usr/bin/env bash

puppet apply --modulepath=/src/mysql/run/modules /src/mysql/run/run.pp

DATA="/mysql/data"

if [ ! "$(ls -A ${DATA})" ]; then
  mysql_install_db --user="mysql" > /dev/null 2>&1
  mysqld_safe > /dev/null 2>&1 &

  TIMEOUT=30

  while ! mysqladmin -u root status > /dev/null 2>&1
  do
    TIMEOUT=$((${TIMEOUT} - 1))

    if [ ${TIMEOUT} -eq 0 ]; then
      exit 1
    fi

    sleep 1
  done

  mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY '${PASSWORD}';"
  mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

  mysqladmin -u root password "${PASSWORD}"
  mysqladmin -u root -p"${PASSWORD}" shutdown
fi

chown -R mysql.mysql "${DATA}"

supervisord -c /etc/supervisor/supervisord.conf