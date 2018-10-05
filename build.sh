#!/bin/sh
set -e

REGISTRY=dukeluke16
IMAGE_NAME=alpine-aws
TAG=$1

docker build --squash -t ${REGISTRY}/${IMAGE_NAME}:${TAG} -t ${REGISTRY}/${IMAGE_NAME}:latest .
docker push ${REGISTRY}/${IMAGE_NAME}
