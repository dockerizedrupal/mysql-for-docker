# docker-mysqld

A [Docker](https://docker.com/) container for [MySQL](http://www.mysql.com/) server.

## MySQL server (DEVELOPMENT BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="mysqlddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mysqld/data \
      simpledrupalcloud/data:dev

    CONTAINER="mysqld" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from mysqlddata \
      -d \
      simpledrupalcloud/mysqld:dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t simpledrupalcloud/mysqld:dev . \
      && cd -

## License

**MIT**
