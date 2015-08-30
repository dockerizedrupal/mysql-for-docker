#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/mysql/build.sh && /src/mysql/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/mysql/variables.sh && /src/mysql/run.sh"
    ;;
esac
