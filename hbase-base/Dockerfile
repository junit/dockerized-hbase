FROM openjdk:8u242-jre-slim

LABEL maintainer="cgiraldo@gradiant.org"
LABEL organization="gradiant.org"

ARG VERSION=2.5.7
ENV HBASE_VERSION=$VERSION \
    HBASE_HOME=/opt/hbase

ENV HBASE_PREFIX=$HBASE_HOME \
    HBASE_CONF_DIR=/etc/hbase \
    HBASE_CONF_hbase_cluster_distributed=true \
    PATH=$PATH:$HBASE_HOME/bin \
    LD_LIBRARY_PATH=/lib/native

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y bash perl curl zlib1g-dev libssl-dev libsnappy-dev libbz2-dev libzstd-dev krb5-user libpam-krb5 && rm -rf /var/lib/apt/lists/* && \
curl -SL http://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz | tar xvz -C /opt && \
ln -s /opt/hbase-$HBASE_VERSION $HBASE_HOME && \
ln -s /opt/hbase-$HBASE_VERSION/conf $HBASE_CONF_DIR && \
mkdir -p /opt/hbase-$HBASE_VERSION/logs && \
HADOOP_VERSION=$(find /opt/hbase/lib -name 'hadoop-common-*.jar' | grep -oP '\d+(\.\d+)+(?=\.)') && \
curl -SL https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz | tar xvz -C /opt && \
mkdir -p /lib/native && \
cp -r /opt/hadoop-$HADOOP_VERSION/lib/native/* /lib/native/ && \
cp /opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/aliyun-sdk-oss-*.jar /opt/hbase-$HBASE_VERSION/lib/ && \
cp /opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/jdom-*.jar /opt/hbase-$HBASE_VERSION/lib/ && \
cp /opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/hadoop-aliyun-*.jar /opt/hbase-$HBASE_VERSION/lib/ && \
rm -rf /opt/hadoop-$HADOOP_VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
