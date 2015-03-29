FROM viljaste/base:dev

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN /src/entrypoint.sh build

VOLUME ["/mysqld"]

EXPOSE 3306

CMD ["/src/entrypoint.sh", "run"]
