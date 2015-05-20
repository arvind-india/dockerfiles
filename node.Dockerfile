FROM debian:latest

MAINTAINER pshoukry <pshoukry@gmail.com>

# Installing node
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

ADD . /src

RUN cd /src; npm install
# run npm install global dependencies
# npm install -g bunyan

#Expose application port
#EXPOSE  8080

#Change CMD to run the node app
#CMD ["node", "/src/index.js"]


