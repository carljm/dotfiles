#!/bin/bash

tarball=$1
nameversion=${tarball%%.tar.xz}
tar -xJvf $tarball
cd $nameversion
./configure --prefix=/opt/$nameversion
make && sudo make install
