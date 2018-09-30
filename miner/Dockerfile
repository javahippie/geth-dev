FROM ubuntu

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
CMD exec ./geth --bootnodes "enode://$bootnodeId@$bootnodeIp:30301" --networkid="500" --verbosity=4 --rpc --rpcapi "eth,web3,personal,net,miner,admin,debug,db" --rpcaddr "0.0.0.0" --rpccorsdomain "*" --syncmode=full --mine --etherbase $address --unlock $address --password ~/.accountpassword --gasprice "0"

EXPOSE 8545
EXPOSE 30303
