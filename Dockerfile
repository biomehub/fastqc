FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER BiomeHub

LABEL version="0.11.8"
LABEL software.version="0.11.8"
LABEL software="FastQC"

RUN apt-get -y update; \
    apt-get -y upgrade
    
RUN apt-get install -y build-essential
    
RUN apt-get install -y wget; \
    apt-get install -y unzip
    
RUN apt-get install -y perl-modules

RUN apt-get install -y openjdk-8-jre

RUN apt-get clean

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip;

RUN unzip fastqc_v0.11.8.zip; \
    mv /FastQC/ /usr/local/bin/; \
    chmod 755 /usr/local/bin/FastQC/fastqc; \
    rm /fastqc_v0.11.8.zip

ENV PATH /usr/local/bin/FastQC/:$PATH