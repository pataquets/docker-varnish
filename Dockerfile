FROM pataquets/ubuntu:trusty

RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5CA1195478F9AB26 \
  && \
  . /etc/lsb-release && \
  echo "deb https://packagecloud.io/varnishcache/varnish40/ubuntu/ ${DISTRIB_CODENAME} main" \
    | tee /etc/apt/sources.list.d/varnish.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install varnish \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/
