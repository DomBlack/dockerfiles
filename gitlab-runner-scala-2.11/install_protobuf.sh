#!/bin/bash

set -e

export CXXFLAGS="$CXXFLAGS -fPIC"

#!/bin/sh
#
# Downloads and installs the startssl CA certs into the global java keystore
# Author: Klaus Reimer <k@ailis.de>
#

JAVA_HOME=/usr/java/latest

# Check if cacerts file is present
if [ ! -f $JAVA_HOME/lib/security/cacerts ]
then
    echo "ERROR: \$JAVA_HOME/lib/security/cacerts not found. JAVA_HOME set correctly?"
    exit 1
fi

# Download the startssl certs
echo "Downloading certs..."
wget --quiet --continue http://www.startssl.com/certs/ca.crt
wget --quiet --continue http://www.startssl.com/certs/sub.class1.server.ca.crt
wget --quiet --continue http://www.startssl.com/certs/sub.class2.server.ca.crt
wget --quiet --continue http://www.startssl.com/certs/sub.class3.server.ca.crt
wget --quiet --continue http://www.startssl.com/certs/sub.class4.server.ca.crt

# Install certs into global keystore
echo "Adding certs to cacerts keystore (sudo password required)..."
$JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -noprompt -alias startcom.ca -file ca.crt
$JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -noprompt -alias startcom.ca.sub.class1 -file sub.class1.server.ca.crt
$JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -noprompt -alias startcom.ca.sub.class2 -file sub.class2.server.ca.crt
$JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -noprompt -alias startcom.ca.sub.class3 -file sub.class3.server.ca.crt
$JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -noprompt -alias startcom.ca.sub.class4 -file sub.class4.server.ca.crt

# If jsse is installed then also put the certs into jssecacerts keystore
if [ -f $JAVA_HOME/lib/security/jssecacerts ]
then
    echo "Adding certs to jssecacerts keystore (sudo password required)..."
    $JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/jssecacerts -storepass changeit -noprompt -alias startcom.ca -file ca.crt
    $JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/jssecacerts -storepass changeit -noprompt -alias startcom.ca.sub.class1 -file sub.class1.server.ca.crt
    $JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/jssecacerts -storepass changeit -noprompt -alias startcom.ca.sub.class2 -file sub.class2.server.ca.crt
    $JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/jssecacerts -storepass changeit -noprompt -alias startcom.ca.sub.class3 -file sub.class3.server.ca.crt
    $JAVA_HOME/bin/keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/jssecacerts -storepass changeit -noprompt -alias startcom.ca.sub.class4 -file sub.class4.server.ca.crt
fi

# Remove downloaded certs
rm -f ca.crt sub.class1.server.ca.crt sub.class2.server.ca.crt sub.class3.server.ca.crt sub.class4.server.ca.crt

if [ ! -f $HOME/local/bin/protoc ]; then

    wget https://github.com/google/protobuf/releases/download/v3.1.0/protobuf-java-3.1.0.tar.gz -O /tmp/protobuf-3.1.0.tar.gz
    tar xf /tmp/protobuf-3.1.0.tar.gz -C /tmp

    cd /tmp/protobuf-3.1.0

    ./configure --enable-static --disable-shared --disable-dependency-tracking
    make
    make install
fi