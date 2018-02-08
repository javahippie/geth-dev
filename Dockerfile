FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

ARG identity

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 

WORKDIR "/opt"
RUN wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz 
RUN tar -xzvf geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz --strip 1

ADD ./genesis.json ./genesis.json

RUN ./geth init genesis.json
RUN echo `date +%s | sha256sum | base64 | head -c 32` > ~/.accountpassword
RUN ./geth --dev --password ~/.accountpassword account new > ~/.primaryaccount


CMD exec ./geth  --networkid="500"  --verbosity=4 --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" -- rcpapi "db,eth,net,web3,personal" --mine --minerthreads=1 --extradata "javahippie"

EXPOSE 8545
EXPOSE 30301/udp
EXPOSE 30303/udp
