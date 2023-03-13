#!/bin/bash
DOCKER_IMAGE_VERSION=23.0.1-git
CONTAINER_NAME=docker-jenkins-agent-docker
IMAGE_NAME=docker-jenkins-agent-docker
JENKINS_AGENT_SSH_PORT=2223 # port is only used in run script - ssh daemon listens at port 22 - docker maps the port to given SSH_PORT
JENKINS_USER=jenkins
JENKINS_PASSWORD=jenkins

export DOCKER_IMAGE_VERSION
export CONTAINER_NAME
export JENKINS_AGENT_SSH_PORT
export JENKINS_USER
export JENKINS_PASSWORD
export IMAGE_NAME
