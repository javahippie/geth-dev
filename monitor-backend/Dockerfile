FROM alpine:3.8

RUN apk update && apk upgrade && \
    apk add --no-cache git nodejs npm

WORKDIR "/opt"

RUN git clone https://nicovergauwen@bitbucket.org/designisdead/eth-net-intelligence-api.git

WORKDIR "/opt/eth-net-intelligence-api"

RUN npm install -g pm2
ADD ./app.json ./app.json
RUN npm install
CMD exec pm2-docker start app.json
