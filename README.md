# docker-mysqld

A [Docker](https://docker.com/) container for [MySQL](http://www.mysql.com/) server.

## MySQL server (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="mysqlddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld/data \
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

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/mysqld:latest . \
      && cd -

## Options

### Setting the MySQL root user password

By starting a container for the very first time, you can pass the MySQL root user password as an environment variable `PASSWORD` to the container. Changing the password is not currently supported.

## License

**MIT**
