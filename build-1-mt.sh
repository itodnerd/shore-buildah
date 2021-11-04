#!/usr/bin/env bash

ctr=$(buildah from shore-system)
buildah config --env GOPATH=/home $ctr #build-essential pkg-config libncurses5-dev libncursesw5-dev
buildah run $ctr /bin/sh -c 'mkdir -p /home/git &&
    cd /home/git &&
    git clone -b config --depth 1 https://github.com/itodnerd/shore-mt.git mt  &&
    cd mt &&
    ./bootstrap &&
    ./configure --with-debug-level2 --enable-trace &&
    make -j;'&&
buildah commit --squash $ctr shore-mt