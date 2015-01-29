FROM centos:latest

MAINTAINER DomBlack <thephenix@gmail.com>

ENV JDK_VERSION 8u31
ENV JDK_CHECKSUM be6abc353ef797755c1c9260c27422e9
ENV JAVA_HOME /usr/java/latest

# Download and install the required version of Oracle's JDK
RUN yum install -y wget \
  && wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-b13/jdk-$JDK_VERSION-linux-x64.rpm" \
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
