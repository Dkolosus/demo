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
RUN apt install -y isc-dhcp-common
RUN apt install -y isc-dhcp-server
RUN groupadd -g 997 foreman
RUN useradd -u 997 -g 997 -s /sbin/nologin foreman

ENTRYPOINT  ["/entrypoint.sh"]
