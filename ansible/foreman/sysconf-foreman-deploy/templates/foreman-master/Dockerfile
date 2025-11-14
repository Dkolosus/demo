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

COPY key/puppet.gpg /tmp/puppet.gpg
COPY key/foreman.asc /tmp/foreman.asc

RUN apt update
RUN apt install -y gnupg2

RUN apt-key add /tmp/puppet.gpg
RUN apt-key add /tmp/foreman.asc

COPY apt-sources/foreman.list /etc/apt/sources.list.d/foreman.list 
COPY apt-sources/puppet.list /etc/apt/sources.list.d/puppet.list

RUN apt update
RUN apt install -y  \
  apache2 \
  openssh-client \
  puppetserver \
  foreman \
  foreman-postgresql \
  foreman-service \
  foreman-dynflow-sidekiq \
  foreman-redis \
  foreman-debug \
  foreman-proxy \
  foreman-cli \
  puppet-agent-oauth \
  redis-server \
  dnsutils \
  syslinux-common \
  pxelinux \
  wget \
  grub-common \
  grub-efi-amd64-bin \
  ruby-json \
  mosquitto \
  python3-ansible-runner \
  ruby-hammer-cli \
  ruby-hammer-cli-foreman \
  ruby-hammer-cli-foreman-puppet \
  ruby-foreman-tasks \
  ruby-foreman-discovery \
  ruby-foreman-puppet \
  ruby-foreman-webhooks \
  ruby-smart-proxy-dynflow \
  ruby-smart-proxy-dhcp-remote-isc \
  ruby-foreman-templates

RUN a2enmod \
  headers \
  ssl \
  proxy \
  rewrite \
  expires \
  http2 \
  proxy_http

RUN mkdir -p /etc/foreman/config
RUN mkdir /mnt/dhcp
RUN mkdir /mnt/dhcp-lib
RUN mkdir /mnt/tftproot
RUN mkdir -p /root/.hammer/cli.modules.d
RUN mkdir -p /usr/share/foreman/public/pub/tftproot
RUN mkdir -p /usr/share/foreman/public/pub/iso

ENTRYPOINT  ["/entrypoint.sh"]
