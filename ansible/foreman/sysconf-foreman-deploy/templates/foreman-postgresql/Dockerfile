FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow 

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

COPY scripts/start_up.sh /entrypoint.sh 

RUN chown root /entrypoint.sh
RUN chgrp root /entrypoint.sh
RUN chmod 777  /entrypoint.sh

RUN rm -f /etc/apt/sources.list
COPY apt-sources/sources.list /etc/apt/sources.list

RUN apt update
RUN apt install -y locales
RUN locale-gen en_US.UTF-8

RUN apt update
RUN apt -y install postgresql-14

RUN mkdir -p /opt/postgresql
RUN mkdir -p /var/lib/postgresql/14/data/
RUN chown postgres:postgres /var/lib/postgresql/14/data/

COPY scripts/foreman.sql /opt/postgresql/foreman.sql

ENTRYPOINT [ "/entrypoint.sh" ]
