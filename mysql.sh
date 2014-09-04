#!/usr/bin/env bash

sudo docker run --name mysql --net host -v /opt/mysql-5.5.28/conf.d:/conf.d -v /opt/mysql-5.5.28/data:/var/lib/mysql -d simpledrupalcloud/mysql:5.5.38
