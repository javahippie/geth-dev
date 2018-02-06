FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 


RUN wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.7.3-4bb3c89d.tar.gz \
	&& tar -xzvf geth-linux-amd64-1.7.3-4bb3c89d.tar.gz

ADD ./genesis.json ./genesis.json

RUN ./geth-linux-amd64-1.7.3-4bb3c89d/geth --datadir="ethdata" init genesis.json
RUN echo `date +%s | sha256sum | base64 | head -c 32` > ~/.accountpassword
RUN ./geth-linux-amd64-1.7.3-4bb3c89d/geth --dev --password ~/.accountpassword account new > ~/.primaryaccount


CMD exec ./geth-linux-amd64-1.7.3-4bb3c89d/geth --dev --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" -- rcpapi "db,eth,net,web3,personal"  --etherbase=0x0000000000000000000000000000000000000000 --datadir ethdata --networkid 15 --mine --minerthreads=1 --extradata "javahippie"

EXPOSE 8545
