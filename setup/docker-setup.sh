#!/usr/bin/env -S bash -x

source .env

if [ ! $PROJECT_BASE ]; then
  echo 'please env PROJECT_BASE, LOC, DOCKER_ID, IMAGE_NAME, IMAGE_TAG'
  exit 1;
fi

docker login && \
docker build --tag $DOCKER_ID/$IMAGE_NAME:$IMAGE_TAG . && \
docker push $DOCKER_ID/$IMAGE_NAME:$IMAGE_TAG