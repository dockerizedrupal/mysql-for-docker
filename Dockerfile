FROM docker-registry.simpledrupalcloud.com/puppet

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./src/build /tmp/build
RUN chmod +x /tmp/build/build.sh
RUN /tmp/build/build.sh
RUN rm -rf /tmp/build

ADD ./src/run.sh /opt/run.sh
RUN chmod +x /opt/run.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["/opt/run.sh"]