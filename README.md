# docker-mysqld

A [Docker](https://docker.com/) container for [MySQL](http://www.mysql.com/) server.

## Run the container

Using the `docker` command:

    CONTAINER="mysqlddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld \
      simpledrupalcloud/data:latest

    CONTAINER="mysqld" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from mysqlddata \
      -e PASSWORD="root" \
      -d \
      simpledrupalcloud/mysqld:latest

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/mysqld:latest . \
      && cd -

## Setting the MySQL root user password

By starting a container for the very first time, you can pass the MySQL root user password as an environment variable `PASSWORD` to the container.

Changing the password afterwards is not currently supported.

## Back up MySQL data

Back up a single MySQL data container

    sudo docker run \
      --rm \
      --volumes-from mysqlddata \
      -v $(pwd):/backup \
      simpledrupalcloud/base:latest tar czvf /backup/mysqlddata.tar.gz /mysqld

Back up all MySQL data containers running on your host

    sudo tools/mysqlddata backup

## Restore MySQL data from a backup

Restore a single MySQL data container from a backup

    CONTAINER="mysqlddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld \
      simpledrupalcloud/data:latest

    sudo docker run \
      --rm \
      --volumes-from mysqlddata \
      -v $(pwd):/backup \
      simpledrupalcloud/base:latest tar xzvf /backup/mysqlddata.tar.gz

Restore all MySQL data containers from a backup

    sudo tools/mysqlddata restore

## License

**MIT**
