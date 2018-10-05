#!/bin/sh
set -e

if [ -z $WORKSPACE ]
then
  WORKSPACE=$(pwd)
fi

REGISTRY=dukeluke16
IMAGE_NAME=alpine-aws
TAG=$1

if [ -z $TAG ]
then
  TAG=latest
fi

DOCKER_IMAGE=${REGISTRY}/${IMAGE_NAME}:${TAG}

docker pull $DOCKER_IMAGE

docker run -it --rm \
  -v $WORKSPACE:/root/src \
  --workdir /root/src \
  $DOCKER_IMAGE $*
