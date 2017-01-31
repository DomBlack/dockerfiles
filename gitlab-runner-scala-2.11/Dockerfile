FROM domblack/scala:latest

LABEL maintainer "thephenix@gmail.com"

COPY install_protobuf.sh /

RUN yum install -y wget curl which gcc gcc-c++ make \
  && /install_protobuf.sh \
  && curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - \
  && yum -y install nodejs \
  && yum clean all \