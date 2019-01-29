FROM centos:7
LABEL maintainer="Ciprian Comarita <ciprian@comarita.com>"

ENV PROXYSQL_VERSION=2.0.1
ENV PERCONA_RELEASE_VERSION=0.1-6

RUN yum install -y https://github.com/sysown/proxysql/releases/download/v${PROXYSQL_VERSION}/proxysql-${PROXYSQL_VERSION}-1-centos7.x86_64.rpm && \
    rpmkeys --import https://www.percona.com/downloads/RPM-GPG-KEY-percona && \
    yum install -y https://www.percona.com/redir/downloads/percona-release/redhat/${PERCONA_RELEASE_VERSION}/percona-release-${PERCONA_RELEASE_VERSION}.noarch.rpm && \
    yum install -y Percona-Server-client-57 bind-utils

ADD proxysql.cnf /etc/proxysql.cnf

COPY proxysql-entry.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

COPY add_cluster_nodes.sh /usr/bin/add_cluster_nodes.sh
RUN chmod a+x /usr/bin/add_cluster_nodes.sh

VOLUME /var/lib/proxysql

EXPOSE 3306 6032
ONBUILD RUN yum update -y

CMD [""]
