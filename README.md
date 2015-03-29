# docker-mysqld

A [Docker](https://docker.com/) container for [MySQL](http://www.mysql.com/) server.

## Run the container

Using the `docker` command:

    CONTAINER="mysqlddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld \
      viljaste/data:dev

    CONTAINER="mysqld" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from mysqlddata \
      -e PASSWORD="root" \
      -d \
      viljaste/mysqld:dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t viljaste/mysqld:dev . \
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
      viljaste/base:dev tar czvf /backup/mysqlddata.tar.gz /mysqld

Back up all MySQL data containers running on your host

    sudo tools/mysqlddata backup

## Restore MySQL data from a backup

Restore a single MySQL data container from a backup

    CONTAINER="mysqlddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld \
      viljaste/data:dev

    sudo docker run \
      --rm \
      --volumes-from mysqlddata \
      -v $(pwd):/backup \
      viljaste/base:dev tar xzvf /backup/mysqlddata.tar.gz

Restore all MySQL data containers from a backup

    sudo tools/mysqlddata restore

## License

**MIT**
