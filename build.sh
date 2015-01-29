#!/bin/sh

for build in */; do
  build=${build%*/}

  docker build --force-rm=true -t domblack/$build $build
done
