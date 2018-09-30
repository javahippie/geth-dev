FROM alpine:3.8

RUN apk update && apk upgrade && \
    apk add --no-cache git nodejs npm

WORKDIR "/opt"

RUN git clone https://nicovergauwen@bitbucket.org/designisdead/eth-netstats.git

WORKDIR "/opt/eth-netstats"
RUN npm install
RUN npm install -g grunt-cli
RUN grunt

CMD WS_SECRET=test npm start
