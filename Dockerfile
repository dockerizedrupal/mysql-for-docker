FROM ubuntu:14.04

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ADD ./src/build.sh /opt/build.sh
RUN chmod +x /opt/build.sh
RUN /opt/build.sh
RUN rm /opt/build.sh

ADD ./src/run.sh /opt/run.sh
RUN chmod +x /opt/run.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["/opt/run.sh"]