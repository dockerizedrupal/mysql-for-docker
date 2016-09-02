> **Notice:** *This project is part of the [Dockerized Drupal](https://dockerizedrupal.com/) initiative.*

# docker-mysql

A Docker image for [MySQL](http://www.mysql.com/) server.

The MySQL root user is `container` and password is also `container`.

## Run the container

    CONTAINER="mysql-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysql \
      --entrypoint /bin/echo \
      dockerizedrupal/mysql:1.2.4 "Data-only container for MySQL."

    CONTAINER="mysql" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from mysql-data \
      -e TIMEZONE="Etc/UTC" \
      -e GENERAL_LOG="Off" \
      -e LOG_ERROR="Off" \
      -e SLOW_QUERY_LOG="Off" \
      -e LOG_QUERIES_NOT_USING_INDEXES="Off" \
      -e LONG_QUERY_TIME="1" \
      -e QUERY_CACHE_TYPE="0" \
      -e QUERY_CACHE_SIZE="1M" \
      -e QUERY_CACHE_LIMIT="1M" \
      -e QUERY_CACHE_MIN_RES_UNIT="4K" \
      -e MAX_ALLOWED_PACKET="16M" \
      -e KEY_BUFFER_SIZE="16M" \
      -e KEY_BUFFER_SIZE="8" \
      -e INNODB_BUFFER_POOL_SIZE="128M" \
      -e INNODB_FLUSH_LOG_AT_TRX_COMMIT="1" \
      -e MAX_CONNECTIONS="151" \
      -d \
      dockerizedrupal/mysql:1.2.4

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.2.4 \
      && sudo docker build -t dockerizedrupal/mysql:1.2.4 . \
      && cd -

## Back up MySQL data

    sudo tools/mysqldata backup

## Restore MySQL data from a backup

    sudo tools/mysqldata restore

## License

**MIT**
