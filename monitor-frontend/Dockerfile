FROM alpine:3.8

MAINTAINER Tim Zöller <mail@tim-zoeller.de>

RUN apk update && apk upgrade && \
    apk add --no-cache git nodejs npm

WORKDIR "/opt"

RUN git clone https://github.com/cubedro/eth-netstats.git

WORKDIR "/opt/eth-netstats"
RUN npm install
RUN npm install -g grunt-cli
RUN grunt

CMD WS_SECRET=test npm start
