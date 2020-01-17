FROM centos:8 

ARG NFDUMP_VERSION=1.6.18

WORKDIR /tmp

## Install OS dependencies
RUN  \
    yum  -y update \ 
    && yum install -y epel-release \
    && yum install -y wget bzip2-devel \
    && yum groupinstall 'Development Tools' -y \
    &&  wget -q --no-check-certificate https://github.com/phaag/nfdump/archive/v$NFDUMP_VERSION.tar.gz \
    && tar xfz v$NFDUMP_VERSION.tar.gz \
    && rm v$NFDUMP_VERSION.tar.gz 

#Build
RUN cd /tmp/nfdump-$NFDUMP_VERSION \
    && ./autogen.sh  \
    && ./configure --enable-nsel=yes --enable-shared=false \
    && make  \
    && cd /tmp/nfdump-$NFDUMP_VERSION && make install  \
    && cd .. \
    && rm -rf nfdump-$NFDUMP_VERSION

VOLUME /data

CMD ["nfcapd", "-T", "all", "-l", "/data", "-S", "1", "-w", "-z", "-p", "9999"]
