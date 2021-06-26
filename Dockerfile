FROM pataquets/ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get -y install \
    ca-certificates \
    gpg \
  && \
  apt-key adv --keyserver hkps://keyserver.ubuntu.com --recv-keys 3AEAFFBB82FBBA5F && \
  . /etc/lsb-release && \
  echo "deb https://packagecloud.io/varnishcache/varnish60lts/ubuntu/ ${DISTRIB_CODENAME} main" \
    | tee /etc/apt/sources.list.d/varnish.list \
  && \
  apt-get update && \
  apt-get -y purge --autoremove \
    gpg \
  && \
  apt-get -y install varnish && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/ \
  && \
  varnishd -V

ENTRYPOINT [ "varnishd", "-F" ]
