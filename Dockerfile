FROM simpledrupalcloud/base-image

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./build /tmp/build

RUN chmod +x /tmp/build/build.sh
RUN /tmp/build/build.sh
RUN rm -rf /tmp/*

VOLUME ["/mysql-5.5.38/conf.d"]
VOLUME ["/mysql-5.5.38/data"]
VOLUME ["/mysql-5.5.38/log"]

EXPOSE 3306

ENTRYPOINT ["/run.sh"]