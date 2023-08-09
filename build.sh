#!/bin/sh
set -x

VERSION=${1:-1.6.23}

docker build --build-arg NFDUMP_VERSION=$VERSION  --tag tacc/netsage-nfdump-collector:$VERSION  collector
#docker build --build-arg NFDUMP_VERSION=$VERSION  --tag netsage/nfdump-collector:$VERSION --squash  collector

docker build --build-arg NFDUMP_VERSION=$VERSION  --tag tacc/netsage-nfdump-collector:alpine-$VERSION -f collector/Dockerfile-alpine  .
#docker build --build-arg NFDUMP_VERSION=$VERSION  --tag netsage/nfdump-collector:alpine-$VERSION -f collector/Dockerfile-alpine --squash  .
