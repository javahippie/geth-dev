FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

ARG identity

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 

WORKDIR "/opt"
RUN wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz 
RUN tar -xzvf geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz --strip 1

ADD ./bootnode.key ./bootnode.key

CMD exec ./bootnode -nodekey bootnode.key

EXPOSE 30301/udp
EXPOSE 30303/udp
