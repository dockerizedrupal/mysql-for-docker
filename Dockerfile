FROM docker-registry.simpledrupalcloud.com/supervisor

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./build /tmp/build

RUN chmod +x /tmp/build/build.sh
RUN /tmp/build/build.sh
RUN rm -rf /tmp/*

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["/opt/run.sh"]