FROM pataquets/ubuntu:trusty

RUN \
  apt-key adv --keyserver hkp://hkps.pool.sks-keyservers.net --recv-keys C4DEFFEB && \
  echo "deb https://repo.varnish-cache.org/ubuntu/ $(lsb_release -cs) varnish-4.0" > /etc/apt/sources.list.d/varnish.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install varnish \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

