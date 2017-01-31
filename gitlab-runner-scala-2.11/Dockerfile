FROM domblack/scala:latest

LABEL maintainer "thephenix@gmail.com"

COPY install_protobuf.sh /

RUN yum install -y wget curl which gcc gcc-c++ make \
  && /install_protobuf.sh \
  && yum clean all \
  && yum -y remove gcc gcc-c++ make