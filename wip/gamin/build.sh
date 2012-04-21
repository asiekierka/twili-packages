#!/bin/sh -e
VER=0.1.10
test -e gamin-$VER.tar.gz || wget http://people.gnome.org/~veillard/gamin/sources/gamin-$VER.tar.gz
rm -rf gamin-$VER;tar -xf gamin-$VER.tar.gz
cd gamin-$VER

CFLAGS="-D_GNU_SOURCE" \
CPPFLAGS="-D_GNU_SOURCE -DPTHREAD_MUTEX_RECURSIVE_NP=PTHREAD_MUTEX_RECURSIVE -DG_CONST_RETURN= " \
./configure --prefix=/

make
make DESTDIR=$1 install -j1

cd ..
rm -rf gamin-$VER
