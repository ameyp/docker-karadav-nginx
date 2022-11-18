FROM ghcr.io/linuxserver/baseimage-alpine-nginx:3.15

ENV KARADAV_PATH="/config/karadav"

RUN \
  apk add --no-cache --upgrade \
    php8-sqlite3 \
    php8-simplexml

RUN mkdir -p /app && \
    curl https://github.com/kd2org/karadav/archive/refs/heads/main.zip \
        -o /app/karadav.zip -L

RUN  sed -i \
    -e 's/;always_populate_raw_post_data.*=.*/always_populate_raw_post_data=-1/g' \
    -e 's/memory_limit.*=.*128M/memory_limit=512M/g' \
    -e 's/max_execution_time.*=.*30/max_execution_time=120/g' \
    -e 's/upload_max_filesize.*=.*2M/upload_max_filesize=1024M/g' \
    -e 's/post_max_size.*=.*8M/post_max_size=1024M/g' \
    -e 's/output_buffering.*=.*/output_buffering=0/g' \
      /etc/php8/php.ini

COPY root/ /
EXPOSE 8080
