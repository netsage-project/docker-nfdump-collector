FROM centos:8 

ARG NFDUMP_VERSION=1.6.23

#Note: the new version requires newer verion of gcc than comes with Centos:8
#later: try upgrading to  rockylinux:9.2, and then try this version ?
#ARG NFDUMP_VERSION=1.7.2

WORKDIR /tmp

ADD https://github.com/phaag/nfdump/archive/v$NFDUMP_VERSION.tar.gz /tmp

## needed to fix Centos 8 mirror issue
RUN cd /etc/yum.repos.d; sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* ; \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

## Install OS dependencies
RUN  yum  -y update 
RUN  yum install -y epel-release 
RUN  yum groupinstall 'Development Tools' -y 
RUN  yum install -y bzip2-devel 


#Build
RUN  tar xfz v$NFDUMP_VERSION.tar.gz 
RUN cd /tmp/nfdump-$NFDUMP_VERSION \
    && ./autogen.sh  \
    && ./configure --enable-nsel=yes --enable-shared=false --enable-sflow  \
    && make  \
    && make install  

# leaving this in the container. Useful for debugging
#    && cd .. \
#    && rm /tmp/v$NFDUMP_VERSION.tar.gz \
#    && rm -rf nfdump-$NFDUMP_VERSION \
#    && yum groupremove -y "Development tools" \
#    && yum clean all

VOLUME /data

#CMD /usr/local/bin/nfcapd -T all -l /data -S 1 -w -z -p  9999
CMD ["/usr/local/bin/nfcapd", "-T", "all", "-l", "/data", "-S", "1", "-w", "-z", "-p", "9999"]
