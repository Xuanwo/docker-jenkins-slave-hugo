FROM jenkins/ssh-slave
LABEL maintainer="Xuanwo <xuanwo@yunify.com>"

ENV HUGO_VERSION=0.55.6

RUN curl --silent --show-error --fail --location \
    --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
    "https://github.com/gohugoio/coredns/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" \
    | tar --no-same-owner -C /usr/bin/ -xz hugo &&\
    chmod 0755 /usr/bin/hugo  &&\
    /usr/bin/hugo -version

ENTRYPOINT ["setup-sshd"]
