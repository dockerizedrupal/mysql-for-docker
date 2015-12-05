#!/usr/bin/env bash

VERSION="1.1.1"

shopt -s nullglob

WORKING_DIR="$(pwd)"

hash docker 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "mysqldata: docker command not found."

  exit 1
fi

help() {
  cat << EOF
Version: ${VERSION}

Usage: mysqldata <backup|restore>
EOF

  exit 1
}

if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
  help
fi

unknown_command() {
  echo "mysqldata: Unknown command. See 'mysqldata --help'"

  exit 1
}

if [ -z "${1}" ]; then
  unknown_command
fi

mysqldata_containers() {
  echo "$(docker ps -a | grep mysql-data | awk '{ print $1 }')"
}

if [ "${1}" = "backup" ]; then
  CONTAINERS="$(mysqldata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    for CONTAINER in ${CONTAINERS}; do
      CONTAINER_NAME="$(docker inspect --format='{{.Name}}' ${CONTAINER} | cut -c 2-)"

      docker run \
        --rm \
        --volumes-from "${CONTAINER}" \
        -v "${WORKING_DIR}:/backup" \
        --entrypoint /bin/bash \
        dockerizedrupal/base-debian-jessie:1.1.0 -c "tar czvf /backup/${CONTAINER_NAME}.tar.gz /mysql"
    done
  fi
elif [ "${1}" = "restore" ]; then
  for FILE in *.tar.gz; do
    CONTAINER="${FILE%%.*}"

    docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysql \
      --entrypoint /bin/echo \
      dockerizedrupal/mysql:1.1.0 "Data-only container for MySQL."

    docker run \
      --rm \
      --volumes-from "${CONTAINER}" \
      -v "${WORKING_DIR}:/backup" \
      --entrypoint /bin/bash \
      dockerizedrupal/mysql:1.1.0 -c "tar xzvf /backup/${CONTAINER}.tar.gz"
  done
else
  unknown_command
fi
