FROM mariadb:10.0
MAINTAINER Jiahao Dai<jiahao.dai@hypers.com>

# $(lsb_release -sc)
RUN apt-get update \
  && apt-get install --force-yes -y \
    percona-xtrabackup \
  \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /usr/{{lib,share}/locale,share/{man,doc,info,gnome/help,cracklib,il8n},{lib,lib64}/gconv,bin/localedef,sbin/build-locale-archive}
