#!/usr/bin/env bash

shopt -s nullglob

WORKING_DIR="$(pwd)"

hash docker 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "mysqlddata: docker command not found."

  exit 1
fi

help() {
  cat << EOF
mysqlddata: Usage: mysqlddata <backup|restore|rm>
EOF

  exit 1
}

if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
  help
fi

unknown_command() {
  echo "mysqlddata: Unknown command. See 'mysqlddata --help'"

  exit 1
}

if [ -z "${1}" ]; then
  unknown_command
fi

mysqlddata_containers() {
  echo "$(docker ps -a | grep mysqlddata | awk '{ print $1 }')"
}

if [ "${1}" = "backup" ]; then
  CONTAINERS="$(mysqlddata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    for CONTAINER in ${CONTAINERS}; do
      CONTAINER_NAME="$(docker inspect --format='{{.Name}}' ${CONTAINER} | cut -c 2-)"

      docker run \
        --rm \
        --volumes-from "${CONTAINER}" \
        -v "${WORKING_DIR}:/backup" \
        simpledrupalcloud/base:dev tar czvf "/backup/${CONTAINER_NAME}.tar.gz" /mysqld
    done
  fi
elif [ "${1}" = "restore" ]; then
  for FILE in *.tar.gz; do
    CONTAINER="${FILE%%.*}"

    docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld \
      simpledrupalcloud/data:dev

    docker run \
      --rm \
      --volumes-from "${CONTAINER}" \
      -v "${WORKING_DIR}:/backup" \
      simpledrupalcloud/base:dev tar xzvf "/backup/${CONTAINER}.tar.gz"
  done
elif [ "${1}" = "rm" ]; then
  CONTAINERS="$(mysqlddata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    docker rm -f ${CONTAINERS}
  fi
else
  unknown_command
fi
