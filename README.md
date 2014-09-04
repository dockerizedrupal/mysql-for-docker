docker-mysql-5.5.38
===================

Run the container
-----------------

    sudo docker run --name mysql --net host -v /opt/mysql-5.5.28/conf.d:/conf.d -v /opt/mysql-5.5.28/data:/var/lib/mysql -d simpledrupalcloud/mysql:5.5.38

Build the image yourself
------------------------

    git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysql.git docker-mysql
    cd docker-mysql
    git checkout 5.5.38
    sudo docker build -t mysql:5.5.38 .