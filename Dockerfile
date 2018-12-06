FROM python:3.6-alpine3.6

COPY requirements.txt /tmp/requirements.txt

RUN set -ex \
      && apk update \
      && apk add --no-cache --virtual .build-deps \
        python3-dev \
        linux-headers \
        libvirt-dev \
        libuuid \
        gcc \
        g++ \
        musl-dev \
      && pip install virtualenv && virtualenv venv \
      && LIBRARY_PATH=/lib:/usr/lib /bin/sh -c "/venv/bin/pip install --no-cache-dir --requirement /tmp/requirements.txt" \
      && runDeps="$( \
             scanelf --needed --nobanner --recursive /venv \
              | awk '{ gsub(/,/, "\nso:", $2); print "so: " $2 }' \
              | sort -u \
              | xargs -r apk info --installed \
              | sort -u \
             )" \
       && apk add --virtual .python-rundeps $runDeps \
       && apk del .build-deps

RUN mkdir -p /opt/optelcloud/ssl
COPY . /opt/optelcloud/
WORKDIR /opt/optelcloud/

CMD ["/venv/bin/uwsgi", "--http", ":8080", "--chdir", "/opt/optelcloud", "--wsgi-file", "/opt/optelcloud/wsgi.py", \
    "--processes", "4", "--threads", "2", "--http-timeout", "36000"]

EXPOSE 8080


