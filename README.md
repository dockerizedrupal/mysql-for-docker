# docker-mysql

A Docker image for [MySQL](http://www.mysql.com/) server.

The MySQL root user is `container` and password is also `container`.

This project is part of the [Dockerized Drupal](https://dockerizedrupal.com/) initiative.

## Run the container

    CONTAINER="mysql-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysql \
      --entrypoint /bin/echo \
      dockerizedrupal/mysql:1.1.1 "Data-only container for Jenkins."

    CONTAINER="mysql" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from mysql-data \
      -e TIMEZONE="Etc/UTC" \
      -e GENERAL_LOG="0" \
      -e SLOW_QUERY_LOG="0" \
      -e LONG_QUERY_TIME="1" \
      -d \
      dockerizedrupal/mysql:1.1.1

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.1.1 \
      && sudo docker build -t dockerizedrupal/mysql:1.1.1 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## Back up MySQL data

    sudo tools/mysqldata backup

## Restore MySQL data from a backup

    sudo tools/mysqldata restore

## License

**MIT**
