ROM debian:latest
MAINTAINER pshoukry <pshoukry@gmail.com>
# Installing node
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y procps
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs
ADD . /src
RUN npm install -g node-gyp
RUN cd /src; npm install
# run npm install global dependencies
RUN npm install -g bunyan
RUN npm install -g nodemon@dev
EXPOSE 3000
WORKDIR /src
CMD nodemon -e js,json,jade | bunyan
