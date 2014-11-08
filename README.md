# docker-mysql-5.5.38-dev

## Run the container

    CONTAINER="mysql" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      -v /var/docker/mysql-5.5.38/data:/mysql-5.5.38/data \
      -d \
      simpledrupalcloud/mysql:5.5.38-dev

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.5.38-dev \
      && sudo docker build -t simpledrupalcloud/mysql:5.5.38-dev . \
      && cd -

## License

**MIT**
