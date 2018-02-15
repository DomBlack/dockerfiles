FROM centos:latest

MAINTAINER DomBlack <thephenix@gmail.com>

ENV JDK_VERSION 8u161
ENV JDK_BUILD_NUM b12
ENV JDK_DOWNLOAD_HASH 2f38c3b165be4555a1fa6e98c45e0808
ENV JDK_CHECKSUM f396f618b7c059089240563d2c46b5fc
ENV JAVA_HOME /usr/java/latest

# Download and install the required version of Oracle's JDK
RUN yum install -y wget \
  && wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-$JDK_BUILD_NUM/$JDK_DOWNLOAD_HASH/jdk-$JDK_VERSION-linux-x64.rpm" \
  && echo "$JDK_CHECKSUM  jdk-$JDK_VERSION-linux-x64.rpm" >> MD5SUM \
  && md5sum -c MD5SUM \
  && yum install -y "jdk-$JDK_VERSION-linux-x64.rpm" \
  && yum clean all \
  && yum -y remove wget \
  && rm -rf "jdk-$JDK_VERSION-linux-x64.rpm" \
            MD5SUM \
            "$JAVA_HOME/*src*.zip" \
            "$JAVA_HOME/lib/visualvm" \
            "$JAVA_HOME/lib/missioncontrol" \
            "$JAVA_HOME/bin/jmc*" \
            "$JAVA_HOME/bin/jvisualvm" \
  && update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 999999 \
  && update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 999999

# If running this image directly, we most likely want bash
CMD ["/bin/bash", "--login"]