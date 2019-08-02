FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER BiomeHub

LABEL version="0.11.8"
LABEL software.version="0.11.8"
LABEL software="FASTQC"

RUN apt-get -y update; \
    apt-get -y upgrade; \
    apt-get -y install build-essential; \
    apt-get -y install wget; \
    apt-get -y install unzip; \
    apt-get install openjdk-8-jre-headless; \
    apt install -y perl-modules-5.22; \
    apt-get clean

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip;

RUN unzip fastqc_v0.11.8.zip; \
    mv /FastQC/ /usr/local/bin/; \
    chmod 755 /usr/local/bin/FastQC/fastqc; \
    rm fastqc_v0.11.3.zip

ENV PATH /usr/local/bin/FastQC/:$PATH