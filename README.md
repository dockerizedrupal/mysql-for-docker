# docker-mysqld-5.5.38-dev

A [Docker](https://docker.com/) container for [MySQL](http://www.mysql.com/).

## MySQL 5.5.38 (DEVELOPMENT BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="mysqlddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v $(pwd)/.docker/mysqld-5.5.38/data:/mysqld-5.5.38/data \
      simpledrupalcloud/data:dev

    CONTAINER="mysqld" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from mysqlddata \
      -d \
      simpledrupalcloud/mysqld:5.5.38-dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.5.38-dev \
      && fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysqld.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.5.38-dev \
      && sudo docker build -t simpledrupalcloud/mysqld:5.5.38-dev . \
      && cd -

## License

**MIT**
