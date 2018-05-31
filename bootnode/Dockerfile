FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 

ARG binary
WORKDIR "/opt"
RUN wget "https://gethstore.blob.core.windows.net/builds/$binary"
RUN tar -xzvf $binary --strip 1
RUN rm $binary

ENV nodekeyhex=""
CMD exec ./bootnode -nodekeyhex $nodekeyhex

EXPOSE 30301/udp
EXPOSE 30303/udp
