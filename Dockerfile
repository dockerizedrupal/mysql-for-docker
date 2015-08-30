FROM dockerizedrupal/base:latest

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm

ADD ./src /src

RUN /src/entrypoint.sh build

VOLUME ["/mysql"]

EXPOSE 3306

ENTRYPOINT ["/src/entrypoint.sh", "run"]
