#!/bin/bash
if [ -z "$PXC_SERVICE" ]; then
        echo >&2 'Error:  You need to specify PXC_SERVICE'
        exit 1
fi

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
        echo >&2 'Error:  You need to specify MYSQL_ROOT_PASSWORD'
        exit 1
fi

if [ -z "$MYSQL_PROXY_USER" ]; then
        echo >&2 'Error:  You need to specify MYSQL_PROXY_USER'
        exit 1
fi

if [ -z "$MYSQL_PROXY_PASSWORD" ]; then
        echo >&2 'Error:  You need to specify MYSQL_PROXY_PASSWORD'
        exit 1
fi

if [ -z "$CONSUL_ADDR" ]; then
        echo >&2 'Error:  You need to specify CONSUL_ADDR'
        exit 1
fi

/usr/bin/add_cluster_nodes.sh &

/usr/bin/proxysql --initial -f -c /etc/proxysql.cnf 
