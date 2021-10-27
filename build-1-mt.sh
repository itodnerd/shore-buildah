#!/usr/bin/env bash

ctr=$(buildah from docker.io/debian:8)
buildah config --env GOPATH=/home $ctr
buildah run $ctr /bin/sh -c 'apt-get update && apt-get upgrade -y && apt-get -y install git autoconf build-essential pkg-config; \
    mkdir -p /home/git
    cd /home/git;\
    git clone https://github.com/epfl-dias/shore-mt.git mt; \
    cd mt;\
    ./bootstrap;\
    ./configure --with-debug-level2 --enable-trace;\
    make;'

buildah commit $ctr shore-mt