#!/bin/sh -e
VER=1.0.4
test -e makedepend-$VER.tar.gz || wget http://xorg.freedesktop.org/releases/individual/util/makedepend-$VER.tar.gz
rm -rf makedepend-$VER;tar -xf makedepend-$VER.tar.gz
cd makedepend-$VER

./configure --prefix=/
make
make DESTDIR=$1 install

cd ..
rm -rf makedepend-$VER
