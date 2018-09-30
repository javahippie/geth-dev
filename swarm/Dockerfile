FROM ubuntu

RUN apt-get update \
     && apt-get install -y wget software-properties-common \
     && rm -rf /var/lib/apt/lists/*

WORKDIR "/root"

RUN add-apt-repository -y ppa:ethereum/ethereum

RUN apt-get update \
     && apt-get install -y ethereum-swarm=0.3.4+build15490+bionic  geth=1.8.16+build15490+bionic

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
RUN geth account import --password ~/.accountpassword  ~/.privatekey

ENV address=""
ENV bootnodeId=""
ENV bootnodeIp=""

CMD exec swarm --bootnodes "enode://$bootnodeId@$bootnodeIp:30399" --password ~/.accountpassword --bzzaccount $address --datadir .ethereum --keystore .ethereum/keystore --bzzapi "0.0.0.0" -corsdomain "*" -httpaddr "0.0.0.0"

EXPOSE 8500
EXPOSE 33099
