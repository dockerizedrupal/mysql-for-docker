docker-mysql
============

Pull the pre-built Docker image from the Docker registry
--------------------------------------------------------

    $ docker pull simpledrupalcloud/mysql

Run the container
-----------------

    $ docker run --name mysql -p 3306:3306 -d simpledrupalcloud/mysql

Stop the container
------------------

    $ docker stop mysql