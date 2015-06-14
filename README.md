# docker-mysqld

A [Docker](https://docker.com/) container for [MySQL](http://www.mysql.com/) server.

## Run the container

Using the `docker` command:

    CONTAINER="mysqlddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld \
      viljaste/data:latest

    CONTAINER="mysqld" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from mysqlddata \
      -e PASSWORD="root" \
      -e GENERAL_LOG="0" \
      -e SLOW_QUERY_LOG="0" \
      -e LONG_QUERY_TIME="1" \
      -d \
      viljaste/mysqld:latest

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/mysqld:latest . \
      && cd -

## Back up MySQL data

    sudo tools/mysqlddata backup

## Restore MySQL data from a backup

    sudo tools/mysqlddata restore

## License

**MIT**
