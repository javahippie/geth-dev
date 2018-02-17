FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 

WORKDIR "/opt"
RUN wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz 
RUN tar -xzvf geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz --strip 1
RUN rm geth-alltools-linux-amd64-1.7.3-4bb3c89d.tar.gz

ADD ./genesis.json ./genesis.json
RUN ./geth init genesis.json

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
RUN ./geth account import --password ~/.accountpassword  ~/.privatekey

ENV address=""
CMD exec ./geth --bootnodes "enode://76a8171707eca17647a47ca99ffd348927dfa60102792ea349a25d5192e61855be83b786e376276a306afcceea4ffd1c9c77e4370b417efc39f328a0d068004c@172.25.0.101:30301" --networkid="500" --verbosity=4 --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" --mine --minerthreads 1 --etherbase $address 
#  --unlock $address --password ~/.accountpassword
EXPOSE 8545
EXPOSE 30301/udp
EXPOSE 30303/udp
