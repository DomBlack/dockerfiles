FROM domblack/oracle-jdk8:latest

MAINTAINER DomBlack <thephenix@gmail.com>

ENV SBT_VERSION 0.13.16
ENV SBT_VERSION_1 1.1.0

# Copy the SBT shell script into the image
COPY sbt /usr/local/bin/

# Download and install SBT, then force SBT to download and compile the compiler-interface for both 2.11 and 2.12
RUN yum install -y wget which \
  && mkdir -p /root/.sbt/launchers/$SBT_VERSION \
  && wget --quiet "https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar" -O /root/.sbt/launchers/$SBT_VERSION/sbt-launch.jar \
  && mkdir -p /root/.sbt/launchers/$SBT_VERSION_1 \
  && wget --quiet "http://repo.scala-sbt.org/scalasbt/maven-releases/org/scala-sbt/sbt-launch/$SBT_VERSION_1/sbt-launch.jar" -O /root/.sbt/launchers/$SBT_VERSION_1/sbt-launch.jar \
  && yum -y remove wget \
  && echo 'object TestApp { def main(args: Array[String]): Unit = println("Hello from Scala " + scala.util.Properties.versionNumberString)  }' > /tmp/TestApp.scala \
  && cd /tmp/ \
  && sbt -sbt-create -211 -sbt-version 0.13.16 run \
  && sbt -sbt-create -212 -sbt-version 0.13.16 run \
  && sbt -sbt-create -211 -sbt-version 1.1.0 run \
  && sbt -sbt-create -212 -sbt-version 1.1.0 run \
  && rm -fR /tmp/*

# If running this image directly, we most likely want the scala REPL
CMD ["sbt", "-sbt-create"]
