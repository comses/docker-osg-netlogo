FROM opensciencegrid/osgvo-ubuntu-20.04

LABEL maintainer="CoMSES Net <support@comses.net>"

ARG NETLOGO_HOME=/opt/netlogo
ARG NETLOGO_VERSION=6.3.0

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    NETLOGO_TARBALL=NetLogo-$NETLOGO_VERSION-64.tgz

ENV NETLOGO_URL=https://ccl.northwestern.edu/netlogo/$NETLOGO_VERSION/$NETLOGO_TARBALL

RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


WORKDIR /opt
RUN wget -q $NETLOGO_URL && \
    tar xzf $NETLOGO_TARBALL && \
    rm -f $NETLOGO_TARBALL && \
    ln -sf "NetLogo $NETLOGO_VERSION" netlogo

WORKDIR /code
