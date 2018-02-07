FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 


RUN wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz 
RUN tar -xzvf geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz --strip 1

ADD ./genesis.json ./genesis.json

RUN ./geth --datadir="ethdata" init genesis.json
RUN echo `date +%s | sha256sum | base64 | head -c 32` > ~/.accountpassword
RUN ./geth --dev --password ~/.accountpassword account new > ~/.primaryaccount

CMD exec ./geth --nodiscover --bootnodes "enode://890b6b5367ef6072455fedbd7a24ebac239d442b18c5ab9d26f58a349dad35ee5783a0dd543e4f454fed22db9772efe28a3ed6f21e75674ef6203e47803da682@[::]:30301" --dev --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" -- rcpapi "db,eth,net,web3,personal"  --etherbase=0x0000000000000000000000000000000000000000 --datadir ethdata --networkid 15 --mine --minerthreads=1 --extradata "javahippie"

EXPOSE 8545
EXPOSE 30301/udp
EXPOSE 30303/udp
