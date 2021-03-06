# Copyright (c) 2012-2017 Red Hat, Inc.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#   Tyler Jewell - Initial Implementation
#

# Initializes an empty directory with the templates needed to configure and run Che.
#
# build:
#   docker build -t eclipse/che-init:<version> .
#
# use (to copy files onto folder):
#   docker run -v $(pwd):/che eclipse/che-init:<version>
#
# use (to run puppet config):
#   docker run <puppet-mounts> --entrypoint=/usr/bin/puppet eclipse/che-init:<version> apply <puppet-apply-options>

# Version adjusted for s390x, runs with the same command as stated above.

FROM puppet/puppet-agent-alpine

# install openssh needed to generate ssh keys
RUN apk --update add openssh \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /files \
    && mkdir -p /etc/puppet/modules \
    && mkdir -p /etc/puppet/manifests \
    && mkdir -p /files/docs

COPY manifests /etc/puppet/manifests
COPY modules /etc/puppet/modules
COPY docs /files/docs
COPY s2i /files/s2i
COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
