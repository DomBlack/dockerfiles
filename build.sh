#!/bin/sh

for build in */; do
  build=${build%*/}

  if [ -e "$build/Dockerfile"]; then
    docker build --force-rm=true -t domblack/$build $build
  fi
done
