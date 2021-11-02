#!/usr/bin/env bash

ctr=$(buildah from docker.io/centos:centos7)
buildah config --env GOPATH=/home $ctr #build-essential pkg-config libncurses5-dev libncursesw5-dev
buildah run $ctr /bin/sh -c 'yum install -y vim git autoconf automake pkgconfig ncurses-devel &&
    yum groupinstall -y "Development Tools"  &&
    mkdir -p /home/git &&
    cd /home/git &&
    git clone https://github.com/itodnerd/shore-mt.git mt  &&
    cd mt &&
    ./bootstrap &&
    ./configure --with-debug-level2 --enable-trace &&
    make;'&&

buildah commit $ctr shore-mt