#!/bin/bash

set -e

export CXXFLAGS="$CXXFLAGS -fPIC"

if [ ! -f $HOME/local/bin/protoc ]; then

    wget https://github.com/google/protobuf/releases/download/v3.1.0/protobuf-java-3.1.0.tar.gz -O /tmp/protobuf-3.1.0.tar.gz
    tar xf /tmp/protobuf-3.1.0.tar.gz -C /tmp

    cd /tmp/protobuf-3.1.0

    ./configure --enable-static --disable-shared --disable-dependency-tracking
    make
    make install
fi