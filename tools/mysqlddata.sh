#!/usr/bin/env bash

WORKING_DIR="$(pwd)"

help() {
  echo "Usage: mysqlddata <export|import|purge>"

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

if [ "${1}" = "export" ]; then
  CONTAINERS="$(mysqlddata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    for CONTAINER in ${CONTAINERS}; do
      CONTAINER_NAME="$(docker inspect --format='{{.Name}}' ${CONTAINER} | cut -c 2-)"

      sudo docker run \
        --rm \
        --volumes-from "${CONTAINER}" \
        -v "${WORKING_DIR}:/backup" \
        simpledrupalcloud/base:latest tar czvf "/backup/${CONTAINER_NAME}.tar.gz" /mysqld/data
    done
  fi
elif [ "${1}" = "import" ]; then
  for FILE in *.tar.gz; do
    CONTAINER="${FILE%%.*}"

    sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld/data \
      simpledrupalcloud/data:latest

    sudo docker run \
      --rm \
      --volumes-from "${CONTAINER}" \
      -v "${WORKING_DIR}:/backup" \
      simpledrupalcloud/base:dev tar xzvf "/backup/${CONTAINER}.tar.gz"
  done
elif [ "${1}" = "purge" ]; then
  CONTAINERS="$(mysqlddata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    sudo docker rm -f "${CONTAINER}"
  fi
fi
