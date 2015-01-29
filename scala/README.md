# Scala 2.11.5 & SBT Image

This image has Scala 2.11.5 running under Oracle's JDK with SBT installed on the latest CentOS image.

SBT is preconfigured and has already downloaded it's dependancies.

By using this image you agree to the [Oracle Binary Code License Agreement](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).

### Building the image

```
git clone https://github.com/DomBlack/dockerfiles && cd dockerfiles

docker build -t 'domblack/scala' scala
```
