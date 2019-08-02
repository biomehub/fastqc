FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update; \
    apt-get -y upgrade; \
    apt-get -y install build-essential; \
    apt-get -y install wget; \
    apt-get -y install unzip; \
    apt-get -y install software-properties-common; \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections; \
    add-apt-repository -y ppa:webupd8team/java; \
    apt-get update; \
    apt-get install -y oracle-java8-installer; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf /var/cache/oracle-jdk8-installer; \
    apt-get clean

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip;

RUN unzip fastqc_v0.11.8.zip; \
    mv /FastQC/ /usr/local/bin/; \
    chmod 755 /usr/local/bin/FastQC/fastqc; \
    rm fastqc_v0.11.3.zip