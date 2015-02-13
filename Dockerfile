FROM pataquets/ubuntu:trusty

RUN \
  gpg --refresh-keys && \
  gpg --recv-key C4DEFFEB && \
  gpg --export --armor | apt-key add - && \
  rm -vrf $HOME/.gnupg && \
  echo "deb https://repo.varnish-cache.org/ubuntu/ $(lsb_release -cs) varnish-4.0" > /etc/apt/sources.list.d/varnish.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install varnish \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

