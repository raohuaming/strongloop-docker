FROM node:0.12
MAINTAINER Huaming Rao <huaming.rao@gmail.com>

# install build tools
RUN apt-get update && apt-get install -y \
  gcc \
  g++ \
  make \
  build-essential \
  libkrb5-dev

#install global npm modules
RUN npm install -g strongloop
RUN npm install -g cnpm --registry=http://registry.npm.taobao.org
RUN npm install -g gulp
RUN npm install -g jshint
RUN npm install -g istanbul
RUN npm install -g source-map
RUN npm install -g forever
RUN npm install -g node-gyp

#clean
RUN npm cache clear
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash", "--login"]
