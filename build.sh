#!/bin/sh
VERSION=${1:-1.6.18}

docker build --build-arg NFDUMP_VERSION=$VERSION  --tag netsage/nfdump-collector:$VERSION --squash  collector
docker build --build-arg NFDUMP_VERSION=$VERSION  --tag netsage/nfdump-collector:alpine-$VERSION -f collector/Dockerfile-alpine --squash  .
