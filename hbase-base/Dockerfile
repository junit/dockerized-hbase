FROM openjdk:8u242-jre-slim

LABEL maintainer="cgiraldo@gradiant.org"
LABEL organization="gradiant.org"

ARG VERSION=2.5.3
ENV HBASE_VERSION=$VERSION \
    HBASE_HOME=/opt/hbase

ENV HBASE_PREFIX=$HBASE_HOME \
    HBASE_CONF_DIR=/etc/hbase \
    HBASE_CONF_hbase_cluster_distributed=true \
    PATH=$PATH:$HBASE_HOME/bin

RUN apt-get update && apt-get install -y bash perl curl && rm -rf /var/lib/apt/lists/* && \
curl -SL http://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz | tar xvz -C /opt && \
ln -s /opt/hbase-$HBASE_VERSION $HBASE_HOME && \
ln -s /opt/hbase-$HBASE_VERSION/conf $HBASE_CONF_DIR && \
mkdir /opt/hbase-$HBASE_VERSION/logs


COPY entrypoint.sh /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
