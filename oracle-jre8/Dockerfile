FROM centos:latest

MAINTAINER DomBlack <thephenix@gmail.com>

ENV JRE_VERSION 8u131
ENV JRE_BUILD_NUM b11
ENV JRE_DOWNLOAD_HASH d54c1d3a095b4ff2b6607d096fa80163
ENV JRE_CHECKSUM ebebfd327e67c4bbe47dabe6b9f6e961
ENV JAVA_HOME /usr/java/latest

# Download and install the required version of Oracle's JDK
RUN yum install -y wget \
  && wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JRE_VERSION-$JRE_BUILD_NUM/$JRE_DOWNLOAD_HASH/jre-$JRE_VERSION-linux-x64.rpm" \
  && echo "$JRE_CHECKSUM  jre-$JRE_VERSION-linux-x64.rpm" >> MD5SUM \
  && md5sum -c MD5SUM \
  && yum install -y "jre-$JRE_VERSION-linux-x64.rpm" \
  && yum clean all \
  && yum -y remove wget \
  && rm -rf "jre-$JRE_VERSION-linux-x64.rpm" \
            MD5SUM \
  && update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 999999

# If running this image directly, we most likely want bash
CMD ["/bin/bash", "--login"]