#!/usr/bin/env bash

ctr=$(buildah from docker.io/centos:centos7)
buildah config --env GOPATH=/home $ctr
buildah run $ctr /bin/sh -c 'yum update -y' &&
buildah run $ctr /bin/sh -c 'yum install -y vim git autoconf automake pkgconfig ncurses-devel' &&
buildah run $ctr /bin/sh -c 'yum groupinstall -y "Development Tools" '&&
buildah run $ctr /bin/sh -c 'yum clean all'&&
buildah commit --squash $ctr shore-system