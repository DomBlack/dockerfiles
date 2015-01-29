# Oracle JDK 8 Image

This image has the Oracle JDK installed within it and is based on the latest CentOS image.

This image is for use in containers which need the ability to compile Java code.

By using this image you agree to the [Oracle Binary Code License Agreement](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).

### Building the image

```
git clone https://github.com/DomBlack/dockerfiles && cd dockerfiles

docker build -t 'domblack/oracle-jdk8' oracle-jdk8
```
