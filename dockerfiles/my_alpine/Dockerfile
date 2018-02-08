# Copyright (c) 2017 Red Hat, Inc.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# build:
#   docker build -t eclipse/che-base .
#
# use:
#    docker run eclipse/che-base

FROM s390x/alpine

# install packages
# coreutils is required for iso8601 compliant date utility


RUN mkdir -p /version \
   && mkdir -p /cli \
   && mkdir /scripts/ \
   && apk add --no-cache ca-certificates coreutils curl openssl bash jq tar \
   && apk add --update bash \
   && apk add --update nodejs \
   && rm -rf /var/cache/apk/* \
   && set -x \ 
   && curl -fSL "https://download.docker.com/linux/static/stable/s390x/docker-17.09.1-ce.tgz" -o docker.tgz \
   && tar -xzvf docker.tgz \
   && mv docker/docker /usr/local/bin/ \
   && rm -rf docker \
   && rm docker.tgz \
   && docker -v

#COPY scripts/base /scripts/base/
#COPY scripts/entrypoint.sh /scripts/entrypoint.sh
#
#RUN chmod u+x /scripts/entrypoint.sh
