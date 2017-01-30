FROM domblack/oracle-jdk8:latest

MAINTAINER DomBlack <thephenix@gmail.com>

ENV SCALA_VERSION 2.11.8
ENV SBT_VERSION 0.13.13
ENV SCALA_HOME /usr/share/scala

# Download and install the required version of Scala
RUN yum install -y wget \
  && wget --quiet "http://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.rpm" \
  && wget --quiet "https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar" -O /usr/local/bin/sbt-launch.jar \
  && yum install -y "scala-$SCALA_VERSION.rpm" sbt \
  && yum clean all \
  && yum -y remove wget \
  && rm -rf "scala-$SCALA_VERSION.rpm"

# Copy the SBT shell script into the image
COPY sbt /usr/local/bin/

# Force SBT to download dependancies and then exit
RUN sbt exit

# If running this image directly, we most likely want the scala REPL
CMD ["scala"]
