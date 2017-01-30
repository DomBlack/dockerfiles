# Minecraft Server
#
# Create a server container using:
#   docker run --name minecraft-data domblack/minecraft-data
#   docker run -d --volumes-from minecraft-data -p 25565:25565 --name minecraft-server domblack/minecraft-server
#
# Or a single container using:
#   docker run -d -p 25565:25565 domblack/minecraft
FROM domblack/minecraft-data

WORKDIR /minecraft-data

ENV MINECRAFT_VERSION 1.8.1

RUN yum install -y wget \
  && wget -O /usr/bin/jsawk https://github.com/micha/jsawk/raw/master/jsawk \
  && chmod +x /usr/bin/jsawk \
  && mkdir /minecraft/ \
  && wget --quiet -O /minecraft/minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_VERSION/minecraft_server.$MINECRAFT_VERSION.jar \
  && chown -R minecraft:minecraft /minecraft/ \
  && yum clean all \
  && yum -y remove wget

EXPOSE 25565
USER minecraft

ENTRYPOINT ["java"]
CMD ["-Xmx1536M", "-Xms768M", "-jar", "/minecraft/minecraft_server.jar", "nogui"]
