FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive

MAINTAINER pshoukry <pshoukry@gmail.com>

RUN apt-get update && apt-get install -y lsb-release
RUN apt-get install -y apt-utils
RUN apt-get install -y adduser
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/debian "$(lsb_release -sc)"/mongodb-org/3.0" main | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# Update apt-get sources AND install MongoDB
RUN apt-get update 
RUN apt-get install -y mongodb-org-server
RUN apt-get install -y mongodb-org

RUN mkdir -p /data/db

# Expose port 27017 from the container to the host
EXPOSE 27017 

# Run Mongodb daemon
CMD ["mongod"]
