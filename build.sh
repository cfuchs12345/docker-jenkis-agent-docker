#!/bin/bash
. env.sh

mkdir -p .ssh
cp -r ~/.ssh/authorized_keys .ssh

docker build -t \
$IMAGE_NAME:latest \
--build-arg DOCKER_IMAGE_VERSION=$DOCKER_IMAGE_VERSION \
--build-arg JENKINS_USER=$JENKINS_USER \
--build-arg JENKINS_PASSWORD=$JENKINS_PASSWORD \
.
