FROM ubuntu:14.04

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/mininet/mininet.git

WORKDIR /mininet/util
RUN ./install.sh
