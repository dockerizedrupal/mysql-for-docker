#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/mysqld/build.sh && /src/mysqld/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/mysqld/variables.sh && /src/mysqld/run.sh"
    ;;
esac
