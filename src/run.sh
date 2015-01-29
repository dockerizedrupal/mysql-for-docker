#!/usr/bin/env bash

puppet apply --modulepath=/src/run/modules /src/run/run.pp

PASSWORD=$([ "${PASSWORD}" ] && echo "${PASSWORD}" || echo "root")

DATADIR="/mysqld/data"

if [ ! "$(ls -A ${DATADIR})" ]; then
  /usr/bin/mysql_install_db --user=mysql > /dev/null 2>&1

  /usr/bin/mysqld_safe > /dev/null 2>&1 &

  TIMEOUT=30

  while ! /usr/bin/mysqladmin -u root status > /dev/null 2>&1
  do
    TIMEOUT=$((${TIMEOUT} - 1))

    if [ ${TIMEOUT} -eq 0 ]; then
      exit 1
    fi

    sleep 1
  done

  mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY '${PASSWORD}';"
  mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

  /usr/bin/mysqladmin -u root password "${PASSWORD}"

  /usr/bin/mysqladmin -u root -p"${PASSWORD}" shutdown
fi

chown -R mysql.mysql "${DATADIR}"

/usr/bin/supervisord
