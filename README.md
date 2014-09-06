docker-mysql-5.5.38
===================

Run the container
-----------------

    sudo docker run \
      --name mysql \
      --net host \
      -v /var/mysql-5.5.38/conf.d:/mysql-5.5.38/conf.d \
      -v /var/mysql-5.5.38/data:/mysql-5.5.38/data \
      -v /var/mysql-5.5.38/log:/mysql-5.5.38/log \
      -d \
      simpledrupalcloud/mysql:5.5.38

Build the image yourself
------------------------

    git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysql.git docker-mysql
    cd docker-mysql
    git checkout 5.5.38
    sudo docker build -t mysql:5.5.38 .