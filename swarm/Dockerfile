FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apt-get update \
     && apt-get install -y wget software-properties-common \
     && rm -rf /var/lib/apt/lists/* 

RUN add-apt-repository -y ppa:ethereum/ethereum

RUN apt-get update \ 
     && apt-get install -y ethereum-swarm=0.3.2+build14973+xenial geth=1.8.14+build14973+xenial

ADD ./genesis.json ./genesis.json
RUN geth init genesis.json

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
RUN geth account import --password ~/.accountpassword  ~/.privatekey

ENV address=""

CMD swarm --bzzaccount $address
