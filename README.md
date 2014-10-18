# docker-mysql-5.5.38-dev

## Run the container

    CONTAINER="mysql-dev" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      -v /var/mysql-5.5.38/conf.d:/mysql-5.5.38/conf.d \
      -v /var/mysql-5.5.38/data:/mysql-5.5.38/data \
      -v /var/mysql-5.5.38/log:/mysql-5.5.38/log \
      -d \
      simpledrupalcloud/mysql:5.5.38-dev

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.5.38-dev \
      && sudo docker build -t simpledrupalcloud/mysql:5.5.38-dev . \
      && cd -
