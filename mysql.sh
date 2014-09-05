#!/usr/bin/env bash

if [ "${#}" -gt 0 ]; then
  sudo docker run \
    --rm \
    -i \
    -t \
    --net host \
    simpledrupalcloud/mysql:5.5.38 "${@}"
else
  sudo docker run \
    --name mysql \
    --net host \
    -v /opt/mysql-5.5.28/conf.d:/conf.d \
    -v /opt/mysql-5.5.28/data:/var/lib/mysql \
    -d \
    simpledrupalcloud/mysql:5.5.38
fi
