FROM debian:9

RUN apt-get update -y
RUN apt-get install -y curl gnupg apt-transport-https
RUN curl https://nginx.org/keys/nginx_signing.key -sS -o nginx_signing.key
RUN apt-key add nginx_signing.key
RUN { \
    echo 'deb https://packages.nginx.org/unit/debian/ stretch unit'; \
    echo 'deb-src https://packages.nginx.org/unit/debian/ stretch unit'; \
} > /etc/apt/sources.list.d/unit.list
RUN apt-get update -y
RUN apt-get install -y \
    unit \
    unit-php
    # unit-python2.7 \
    # unit-python3.5 \
    # unit-go1.7 \
    # unit-go1.8 \
    # unit-perl \
    # unit-ruby
COPY etc/unit/config.json /etc/unit/config.json
COPY www/php/index.php /www/php/index.php
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
