FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 


RUN wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz 
RUN tar -xzvf geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz --strip 1

CMD ./bootnode -nodekeyhex dc90f8f7324f1cc7ba52c4077721c939f98a628ed17e51266d01c9cd0294033a

EXPOSE 30301/udp
EXPOSE 30303/udp
