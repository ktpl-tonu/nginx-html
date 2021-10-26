FROM ubuntu:18.04

LABEL maintainer="tonu@krishtechnolabs.com"

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y language-pack-en-base software-properties-common apt-utils apt-transport-https
RUN apt-get update && apt-get install -y curl wget language-pack-en-base nginx supervisor rsyslog sudo --no-install-recommends \
    && locale-gen en_US.UTF-8 \
    && export LANG=en_US.UTF-8 \
    && LC_ALL=en_US.UTF-8

COPY html/* /usr/share/html/
COPY ./supervisord.conf /etc/supervisor/supervisord.conf

RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
