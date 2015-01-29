# Oracle JRE 8 Image

This image has the Oracle JRE installed within it and is based on the latest CentOS image.

This image is intended for use by containers which only need to run existing java applications.

By using this image you agree to the [Oracle Binary Code License Agreement](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).

### Building the image

```
git clone https://github.com/DomBlack/dockerfiles && cd dockerfiles

docker build -t 'domblack/oracle-jre8' oracle-jre8
```
