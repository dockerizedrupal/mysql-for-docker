# docker-mysql

A [Docker](https://docker.com/) container for [MySQL](http://www.mysql.com/) server.

## Run the container

Using the `docker` command:

    CONTAINER="mysql-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysql \
      dockerizedrupal/data:1.0.3

    CONTAINER="mysql" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from mysql-data \
      -e TIMEZONE="Etc/UTC" \
      -e PASSWORD="root" \
      -e GENERAL_LOG="0" \
      -e SLOW_QUERY_LOG="0" \
      -e LONG_QUERY_TIME="1" \
      -d \
      dockerizedrupal/mysql:1.0.6

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.6 \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.6 \
      && sudo docker build -t dockerizedrupal/mysql:1.0.6 . \
      && cd -

## Back up MySQL data

    sudo tools/mysqldata backup

## Restore MySQL data from a backup

    sudo tools/mysqldata restore

## License

**MIT**
