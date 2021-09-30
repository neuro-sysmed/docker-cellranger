# docker version of 10X cellranger for single cell analysis

#FROM alpine
FROM ubuntu:20.04

ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY cellranger-6.1.1.tar.gz /tmp/cellranger.tgz


RUN apt-get update && \
    apt-get install --no-install-recommends --assume-yes -qq curl  ca-certificates && \
    apt-get clean


RUN mkdir -p /usr/local/cellranger && \
      tar zxvf /tmp/cellranger.tgz --strip 1 -C /usr/local/cellranger && \
      ln -s /usr/local/cellranger/bin/cellranger /usr/local/bin/cellranger && \
      rm -f /tmp/cellranger.tgz


RUN curl -Lo /usr/local/bin/bamtofastq https://cf.10xgenomics.com/misc/bamtofastq-1.3.2 && \
    chmod 755 /usr/local/bin/bamtofastq

