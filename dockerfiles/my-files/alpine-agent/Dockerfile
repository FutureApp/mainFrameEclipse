# Adjusted Dockerfile to build puppet-agent-alpine for s390x Architectures
# Run from the file directory "sudo docker build -t 
# 'puppet/puppet-agent-alpine' ." in order to create a 
# Docker image. Requires alpine docker image with tag s390x/alpine:3.6.

FROM s390x/alpine:3.6
MAINTAINER Gareth Rushgrove "gareth@puppet.com"

ENV PUPPET_VERSION="5.3.2" FACTER_VERSION="2.5.1"

LABEL org.label-schema.vendor="Puppet" \
      org.label-schema.url="https://github.com/puppetlabs/puppet-in-docker" \
      org.label-schema.name="Puppet Agent (Alpine)" \
      org.label-schema.license="Apache-2.0" \
      org.label-schema.version=$PUPPET_VERSION \
      org.label-schema.vcs-url="https://github.com/puppetlabs/puppet-in-docker" \
      org.label-schema.vcs-ref="897dbb17ad2194153ef09e5e9b684f17ceb019a2" \
      org.label-schema.build-date="2017-10-24T11:26:06Z" \
      org.label-schema.schema-version="1.0" \
      com.puppet.dockerfile="/Dockerfile"

RUN apk add --update \
      ca-certificates \
      pciutils \
      ruby \
      ruby-irb \
      ruby-rdoc \
      && \
    echo http://dl-4.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk add --update shadow && \
    rm -rf /var/cache/apk/* && \
    gem install puppet:"$PUPPET_VERSION" facter:"$FACTER_VERSION" && \
    /usr/bin/puppet module install puppetlabs-apk

# Workaround for https://tickets.puppetlabs.com/browse/FACT-1351
# RUN rm /usr/lib/ruby/gems/2.3.0/gems/facter-"$FACTER_VERSION"/lib/facter/blockdevices.rb

ENTRYPOINT ["/usr/bin/puppet"]
CMD ["agent", "--verbose", "--onetime", "--no-daemonize", "--summarize" ]

COPY Dockerfile /
