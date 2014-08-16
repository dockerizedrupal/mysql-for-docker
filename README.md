docker-mysql
============

Build the container
-----------------

`# docker build -t mysql http://git.simpledrupalcloud.com/viljaste/docker-mysql.git`

Push the image to private docker registry
---------------------

`# docker tag mysql docker-registry.simpledrupalcloud.com/mysql`

`# docker push docker-registry.simpledrupalcloud.com/mysql`

Pull the image from the private docker registry
---------------------

`# docker pull docker-registry.simpledrupalcloud.com/mysql`

Run the container
---------------

`# docker run --name mysql -p 3306:3306 -d mysql`