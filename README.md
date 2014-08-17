docker-mysql
============

Docker image to run a MySQL database server

Build the container
-------------------

`$ docker build -t docker-registry.simpledrupalcloud.com/mysql http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mysql.git`

Push the image to private docker registry
-----------------------------------------

`$ docker push docker-registry.simpledrupalcloud.com/mysql`

Pull the image from the private docker registry
-----------------------------------------------

`$ docker pull docker-registry.simpledrupalcloud.com/mysql`

Run the container
-----------------

`$ docker run --name mysql -p 3306:3306 -d docker-registry.simpledrupalcloud.com/mysql`