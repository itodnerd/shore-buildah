#!/usr/bin/env bash

ctr=$(buildah from shore-mt)
buildah config --env GOPATH=/home/git $ctr
buildah run $ctr /bin/sh -c 'cd /home/git;\
    git clone https://github.com/epfl-dias/shore-kits.git kits; \
    cd kits;\
    ln -s /home/git/mt/m4;\
    ls;\
    ./autogen.sh &&
    ./configure --with-shore=/home/git/mt --with-glibtop --enable-debug;'

buildah commit $ctr shore-kit