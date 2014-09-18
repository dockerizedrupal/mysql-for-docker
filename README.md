docker-mysql
============

MySQL 5.5.38
------------

### Run the container

    CONTAINER=mysql && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 3306:3306 \
      -v /var/mysql-5.5.38/conf.d:/mysql-5.5.38/conf.d \
      -v /var/mysql-5.5.38/data:/mysql-5.5.38/data \
      -v /var/mysql-5.5.38/log:/mysql-5.5.38/log \
      -d \
      simpledrupalcloud/mysql:5.5.38

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysql.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 5.5.38 \
      && sudo docker build -t simpledrupalcloud/mysql:5.5.38 . \
      && cd -
