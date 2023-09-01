#!/bin/sh
set -x

#VERSION=${1:-1.6.23}
VERSION=${1:-1.7.2}

# currently only using alpine linux version
#docker build --build-arg NFDUMP_VERSION=$VERSION  --tag tacc/netsage-nfdump-collector:$VERSION  collector

docker build --build-arg NFDUMP_VERSION=$VERSION  --tag tacc/netsage-nfdump-collector:alpine-$VERSION -f collector/Dockerfile-alpine  .

