FROM ubuntu:18.04

LABEL maintainer="tonu@krishtechnolabs.com"

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y language-pack-en-base software-properties-common apt-utils apt-transport-https
RUN apt-get update && apt-get install -y curl wget language-pack-en-base nginx supervisor rsyslog sudo --no-install-recommends \
    && locale-gen en_US.UTF-8 \
    && export LANG=en_US.UTF-8 \
    && LC_ALL=en_US.UTF-8

COPY ./docker/html/* /var/www/html/
COPY ./docker/files/supervisord.conf /etc/supervisor/supervisord.conf
COPY ./docker/files/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
