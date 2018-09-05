from ubuntu

RUN apt-get update \
&& apt-get install -y python-pip \
&& pip install shadowsocks

RUN sed -i "s/cleanup/reset/g" /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py

COPY ./config.json /config.json

ENTRYPOINT sslocal -c /config.json
