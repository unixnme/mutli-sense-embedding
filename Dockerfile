FROM ubuntu:20.04

WORKDIR /root
RUN apt-get update && apt-get install -y build-essential wget vim unzip git

RUN git clone https://github.com/unixnme/mutli-sense-embedding.git multisense
WORKDIR /root/multisense
RUN wget http://mattmahoney.net/dc/text8.zip -O text8.zip
RUN unzip text8.zip

