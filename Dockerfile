FROM registry.alauda.cn/library/mariadb:10.0
MAINTAINER Jiahao Dai<jiahao.dai@hypers.com>

ADD sources.list /etc/apt/sources.list

# backup script priciples
ADD note/s3cfg /root/.s3cfg
ADD note/db-backup.conf /etc/db-backup.conf
ADD note/backup.sh /opt/backup.sh

ADD entrypoint.sh /opt/entrypoint.sh

RUN apt-get update \
  && apt-get install --force-yes -y \
    percona-xtrabackup s3cmd\
  \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /usr/{{lib,share}/locale,share/{man,doc,info,gnome/help,cracklib,il8n},{lib,lib64}/gconv,bin/localedef,sbin/build-locale-archive}
  
VOLUME ["/tmp"]

CMD chmod +x /opt/*.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
