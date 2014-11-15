# docker-mysql-5.5.38

A [Docker](https://docker.com/) container for [MySQL](http://www.mysql.com/).

## MySQL 5.5.38 (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v $(pwd)/.docker/mysql-5.5.38/data:/mysql-5.5.38/data \
      simpledrupalcloud/data:latest

    CONTAINER="mysql" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      --volumes-from data \
      -d \
      simpledrupalcloud/mysql:5.5.38

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.5.38 \
      && fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.5.38 \
      && sudo docker build -t simpledrupalcloud/mysql:5.5.38 . \
      && cd -

## License

**MIT**
