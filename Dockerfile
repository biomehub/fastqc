FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER LFelipedeOliveira <felipe@neoprospecta.com>

RUN apt-get -y update; \
  apt-get -y upgrade; \
  apt-get -y install python3 build-essential zlibc libc6 gcc g++ libboost1.54-all-dev cmake python3-pip; \
  apt-get -y install wget; \
  apt-get -y install software-properties-common python-software-properties unzip; \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections; \
  add-apt-repository -y ppa:webupd8team/java; \
  apt-get update; \
  apt-get install -y oracle-java8-installer; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*; \
  rm -rf /var/cache/oracle-jdk8-installer; \
  apt-get clean

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip; \
    unzip fastqc_v0.11.8.zip; \
    mv /FastQC/ /usr/local/bin/; \
    chmod 755 /usr/local/bin/FastQC/fastqc; \
    rm fastqc_v0.11.3.zip
