FROM jenkins/ssh-slave
LABEL maintainer="Xuanwo <xuanwo@yunify.com>"

ENV HUGO_VERSION=0.55.6

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update \
    && apt-get install --no-install-recommends -y openssh-client git \
    && rm -rf /var/lib/apt/lists/*

RUN curl --silent --show-error --fail --location \
    --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
    "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" \
    | tar --no-same-owner -C /usr/bin/ -xz hugo &&\
    chmod 0755 /usr/bin/hugo

ENTRYPOINT ["setup-sshd"]
