FROM pataquets/ubuntu:xenial

RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 34BF6E8ECBF5C49E \
  && \
  . /etc/lsb-release && \
  echo "deb https://packagecloud.io/varnishcache/varnish41/ubuntu/ ${DISTRIB_CODENAME} main" \
    | tee /etc/apt/sources.list.d/varnish.list \
  && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install varnish \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/ \
  && \
  varnishd -V

ENTRYPOINT [ "varnishd", "-F" ]
