#!/usr/bin/env bash

shopt -s nullglob

WORKING_DIR="$(pwd)"

help() {
  echo "Usage: mysqlddata <backup|restore|rm>"

  exit 1
}

if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
  help
fi

unknown_command() {
  echo "Unknown command. See 'mysqlddata --help'"

  exit 1
}

if [ -z "${1}" ]; then
  unknown_command
fi

mysqlddata_containers() {
  echo "$(sudo docker ps -a | grep mysqlddata | awk '{ print $1 }')"
}

if [ "${1}" = "backup" ]; then
  CONTAINERS="$(mysqlddata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    for CONTAINER in ${CONTAINERS}; do
      CONTAINER_NAME="$(docker inspect --format='{{.Name}}' ${CONTAINER} | cut -c 2-)"

      sudo docker run \
        --rm \
        --volumes-from "${CONTAINER}" \
        -v "${WORKING_DIR}:/backup" \
        simpledrupalcloud/base:dev tar czvf "/backup/${CONTAINER_NAME}.tar.gz" /mysqld
    done
  fi
elif [ "${1}" = "restore" ]; then
  for FILE in *.tar.gz; do
    CONTAINER="${FILE%%.*}"

    sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld \
      simpledrupalcloud/data:dev

    sudo docker run \
      --rm \
      --volumes-from "${CONTAINER}" \
      -v "${WORKING_DIR}:/backup" \
      simpledrupalcloud/base:dev tar xzvf "/backup/${CONTAINER}.tar.gz"
  done
elif [ "${1}" = "rm" ]; then
  CONTAINERS="$(mysqlddata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    sudo docker rm -f ${CONTAINERS}
  fi
else
  unknown_command
fi
