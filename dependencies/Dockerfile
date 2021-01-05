FROM ubuntu:16.04
MAINTAINER "ArthurWuTw <lion811004@gmail.com>"

ARG CONTAINER_USER
ARG HOST_USER_GID
ARG HOST_USER_UID
ARG TIMEZONE

WORKDIR /tmp

# Disable interactive configuration
ENV DEBIAN_FRONTEND=noninteractive

# Setup the host's timezone
RUN apt-get update && \
  ln -sf /usr/share/zoneinfo${TIMEZONE:?} /etc/localtime && \
  apt-get install -y tzdata

# Create user
COPY create-user utils.sh ./
RUN ./create-user && \
  rm create-user utils.sh

# Install host's certification
RUN apt-get update && \
  apt-get install -y ca-certificates && \
  update-ca-certificates

# Install apt-getable dependencies
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        python \
        git \
        curl \
        openssh-server \
        git-core

COPY enter-container-shell \
    infinite-loop \
    /usr/local/bin/
RUN chmod +x /usr/local/bin/infinite-loop
RUN chmod +x /usr/local/bin/enter-container-shell

ARG CONTAINER_PERSISTENT_DIR
ARG CONTAINER_REPO_DIR
ENV CONTAINER_REPO_DIR $CONTAINER_REPO_DIR
ARG CONTAINER_WORKSPACE_LINK

RUN mkdir ${CONTAINER_PERSISTENT_DIR:?}
RUN mkdir /home/${CONTAINER_USER:?}/.ssh

ARG CONTAINER_HOME
RUN BASH_HISTORY=${CONTAINER_PERSISTENT_DIR:?}/user-bash-history && \
   touch $BASH_HISTORY && \
   chown ${CONTAINER_USER:?}:${CONTAINER_USER:?} $BASH_HISTORY && \
   ln -s $BASH_HISTORY ${CONTAINER_HOME:?}/.bash_history
