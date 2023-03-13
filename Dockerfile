ARG DOCKER_IMAGE_VERSION=23.0.1-git
ARG JENKINS_USER=jenkins
ARG JENKINS_PASSWORD=jenkins
ARG SSH_PORT=22

FROM docker:$DOCKER_IMAGE_VERSION

# need to repeate - otherwise args no longer set after FROM comand
ARG DOCKER_IMAGE_VERSION
ARG JENKINS_USER
ARG JENKINS_PASSWORD
ARG SSH_PORT

RUN apk update \
  && apk upgrade \
  #&& apk add ca-certificates \
  #&& update-ca-certificates \
  #&& apk add --update coreutils && rm -rf /var/cache/apk/*   \ 
  && apk add --update openjdk11 tzdata curl unzip bash \
  && apk add openssh \
  #&& apk add git \
  && rm -rf /var/cache/apk/*
  #&& rc-update add sshd

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config \
    && username=$JENKINS_USER \
    && password=$JENKINS_PASSWORD \
    && adduser -h /home/$username -s /bin/sh -D $username \
    && echo $username:$password | chpasswd \
    && mkdir -p /var/jenkins \
    && chown -R $username:$username /var/jenkins \
    && mkdir -p /root/.ssh \
    && ssh-keygen -A
    # && ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N "" -t rsa

USER ${JENKINS_USER}
RUN username=$JENKINS_USER \
    && mkdir -p /home/$username/.ssh \
    && ssh-keygen -q -f /home/$username/.ssh/id_rsa -N ""

    
#for debug if docker works for jenkins user: 
# RUN docker --version
USER root

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE $SSH_PORT
COPY entrypoint.sh /
