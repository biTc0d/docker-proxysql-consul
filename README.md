ProxySQL docker image with Consul support
===================================

The docker image is available right now at `bitc0d/proxysql-consul:latest`.

[See it on Docker Hub](https://hub.docker.com/r/bitc0d/proxysql-consul)

Basic usage
-----------

`docker run -d bitc0d/proxysql-consul:latest add_cluster_nodes.sh`

The Docker image accepts the following parameters (all are mandatory):
* `MYSQL_ROOT_PASSWORD`
* `MYSQL_PROXY_USER`
* `MYSQL_PROXY_PASSWORD`
* `PXC_SERVICE`
