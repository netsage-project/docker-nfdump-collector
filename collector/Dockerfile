FROM centos:8 

ARG NFDUMP_VERSION=1.6.18

WORKDIR /tmp

## Install OS dependencies
ADD https://github.com/phaag/nfdump/archive/v$NFDUMP_VERSION.tar.gz /tmp
RUN  \
    yum  -y update \ 
    && yum install -y epel-release \
    && yum install -y bzip2-devel \
    && yum groupinstall 'Development Tools' -y \
    && tar xfz v$NFDUMP_VERSION.tar.gz 

#Build
RUN cd /tmp/nfdump-$NFDUMP_VERSION \
    && ./autogen.sh  \
    && ./configure --enable-nsel=yes --enable-shared=false --enable-sflow  \
    && make  \
    && cd /tmp/nfdump-$NFDUMP_VERSION && make install  \
    && cd .. \
    && rm /tmp/v$NFDUMP_VERSION.tar.gz \
    && rm -rf nfdump-$NFDUMP_VERSION \
    && yum groupremove -y "Development tools" \
    && yum clean all

VOLUME /data

CMD ["nfcapd", "-T", "all", "-l", "/data", "-S", "1", "-w", "-z", "-p", "9999"]
