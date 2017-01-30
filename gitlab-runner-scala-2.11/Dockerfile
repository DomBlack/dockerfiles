FROM domblack/scala:latest

LABEL maintainer "thephenix@gmail.com"

COPY install_protobuf.sh /

RUN yum install -y wget gcc gcc-c++ \
  && /install_protobuf.sh \
  && yum clean all \
  && yum -y remove wget gcc gcc-c++