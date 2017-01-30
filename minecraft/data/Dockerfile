# Minecraft Data Container
#
# Create a data container using:
#   docker run --name minecraft-data domblack/minecraft-data

FROM domblack/oracle-jre8:latest

MAINTAINER DomBlack <thephenix@gmail.com>

RUN useradd -s /bin/bash -d /minecraft-data --uid 10000 -m minecraft

ADD eula.txt /minecraft-data/eula.txt
ADD server.properties /minecraft-data/server.properties

RUN chown minecraft:minecraft /minecraft-data/*

VOLUME ["/minecraft-data"]
