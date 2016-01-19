# get latest debian docker base image
FROM debian:latest
# make sure wget and tar are installed
RUN apt-get update && apt-get install wget tar -y
# create and set working directory
RUN mkdir /opt/jdk18
WORKDIR /opt/jdk18
# tricky download of oracle jdk 1.8
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.tar.gz" -O jdk.tar.gz
# unpack jdk to actual folder (ignoring root folder from archive)
RUN tar xvf jdk.tar.gz --strip 1
# clean up
RUN rm jdk.tar.gz
# set up environment for jdk
ENV JAVA_HOME=/opt/jdk18
ENV PATH=$PATH:$JAVA_HOME/bin
# set working dir
WORKDIR /root

# deploy the app (jar)
ADD target/spring-docker-app-1.0-SNAPSHOT.jar /root
