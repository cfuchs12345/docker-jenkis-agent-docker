#!/bin/bash

. env.sh

docker run -d -p $JENKINS_AGENT_SSH_PORT:22 -v /var/run/docker.sock:/var/run/docker.sock --privileged --restart always --name $CONTAINER_NAME $IMAGE_NAME:latest
