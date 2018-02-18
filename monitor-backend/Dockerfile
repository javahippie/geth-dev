FROM ubuntu:xenial

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apt-get update \
      && apt-get install -y wget nodejs npm ntp git\
      && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/nodejs /usr/bin/node

WORKDIR "/opt"

RUN git clone https://github.com/cubedro/eth-net-intelligence-api.git

WORKDIR "/opt/eth-net-intelligence-api"

RUN npm install -g pm2
ADD ./app.json ./app.json
RUN npm install
CMD exec pm2-docker start app.json
