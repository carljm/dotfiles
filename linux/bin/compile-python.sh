#!/bin/bash

mkdir -p /home/carljm/pythons

tarball=$1
nameversion=${tarball%%.tar.xz}
tar -xJvf $tarball
cd $nameversion
./configure --prefix=/home/carljm/pythons/$nameversion
make && make install
