FROM ubuntu:xenial

RUN apt-get update \
     && apt-get install -y wget software-properties-common \
     && rm -rf /var/lib/apt/lists/*

WORKDIR "/root"

RUN add-apt-repository -y ppa:ethereum/ethereum

RUN apt-get update \
     && apt-get install -y ethereum=1.8.17+build15807+xenial

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
ADD ./genesis.json ./genesis.json
RUN geth init genesis.json
RUN geth account import --password ~/.accountpassword  ~/.privatekey

RUN apt-get install -y ethereum-swarm=0.3.5+build15807+xenial

ENV address=""
ENV bootnodeId=""
ENV bootnodeIp=""

CMD exec swarm --bootnodes "enode://$bootnodeId@$bootnodeIp:30399" --password ~/.accountpassword --bzzaccount $address --datadir .ethereum --keystore .ethereum/keystore --bzzapi "0.0.0.0" -corsdomain "*" -httpaddr "0.0.0.0"

EXPOSE 8500
EXPOSE 33099
