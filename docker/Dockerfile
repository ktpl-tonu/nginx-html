FROM ubuntu:18.04

LABEL maintainer="tonu@krishtechnolabs.com"

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y language-pack-en-base software-properties-common apt-utils apt-transport-https
RUN apt-get update && apt-get install -y curl wget language-pack-en-base nginx supervisor rsyslog sudo --no-install-recommends \
    && locale-gen en_US.UTF-8 \
    && export LANG=en_US.UTF-8 \
    && LC_ALL=en_US.UTF-8 \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update --no-install-recommends \
    && apt-get install -y php7.3 php7.3-cli php7.3-fpm php7.3-common php7.3-gd php7.3-mysql php7.3-curl php7.3-intl php7.3-xsl php7.3-mbstring php7.3-zip php7.3-bcmath php7.3-iconv php7.3-soap --no-install-recommends \
# forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && ln -sf /dev/stdout /var/log/nginx/www-magento-access.log \
    && ln -sf /dev/stderr /var/log/nginx/www-magento-error.log \
    && ln -sf /dev/stdout /var/log/php-fpm-access.log \
    && ln -sf dev/stderr /var/log/php-fpm-errors.log


COPY ./docker/html/* /var/www/html/
COPY ./docker/files/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./docker/files/supervisord.conf /etc/supervisor/supervisord.conf
COPY ./docker/files/default /etc/nginx/sites-available/default
COPY ./docker/files/docker-entrypoint.sh /



#ENTRYPOINT ["/docker-entrypoint.sh"]
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
