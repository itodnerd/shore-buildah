#!/usr/bin/env bash

ctr=$(buildah from shore-mt)
buildah config --env GOPATH=/home/git $ctr
buildah run $ctr /bin/sh -c 'cd /home/git &&
    git clone https://github.com/itodnerd/shore-kits.git kits &&
    cd kits &&
    git checkout config &&
    ln -s /home/git/mt/m4 &&
    ./autogen.sh &&
    ./configure --with-shore=/home/git/mt --with-glibtop --enable-debug &&
    make -j;' &&

buildah commit $ctr shore-kit