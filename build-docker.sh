#!/bin/bash

VERSION=2.5.7

docker build --build-arg VERSION=$VERSION -t junit/hbase-base:$VERSION hbase-base
docker build --build-arg VERSION=$VERSION -t junit/hbase-master:$VERSION hbase-master
docker build --build-arg VERSION=$VERSION -t junit/hbase-region:$VERSION hbase-region

docker tag junit/hbase-base:$VERSION junit/hbase-base:latest
docker tag junit/hbase-master:$VERSION junit/hbase-master:latest
docker tag junit/hbase-region:$VERSION junit/hbase-region:latest
