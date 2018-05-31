FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 

WORKDIR "/opt"
ARG binary
RUN wget "https://gethstore.blob.core.windows.net/builds/$binary"
RUN tar -xzvf $binary --strip 1
RUN rm $binary

ADD ./genesis.json ./genesis.json
RUN ./geth init genesis.json

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
RUN ./geth account import --password ~/.accountpassword  ~/.privatekey

ENV address=""
ENV bootnodeId=""
ENV bootnodeIp=""
CMD exec ./geth --bootnodes "enode://$bootnodeId@$bootnodeIp:30301" --networkid="500" --verbosity=4 --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" --etherbase $address --unlock $address --password ~/.accountpassword

EXPOSE 8545
EXPOSE 30303
