FROM simpledrupalcloud/base:latest

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN chmod +x /src/build.sh
RUN /src/build.sh

RUN rm -rf /tmp/*

VOLUME ["/mysqld-5.5.38/data"]

EXPOSE 3306

ENTRYPOINT ["/src/run.sh"]
