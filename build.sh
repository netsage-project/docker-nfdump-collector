#!/bin/sh
VERSION=${1:-1.6.18}

docker build --build-arg NFDUMP_VERSION=$VERSION  --tag netsage/nfdump-collector:$VERSION collector
