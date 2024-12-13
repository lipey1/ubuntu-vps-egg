ARG UBUNTU_VERSION
FROM ubuntu:${UBUNTU_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y \
        curl \
        wget \
        sudo \
        bash \
        openssh-server \
        ca-certificates \
        locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]