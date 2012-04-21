#!/bin/sh -e
VER=0.1.14
test -e pekwm-$VER.tar.bz2 || wget https://pekwm.org/projects/pekwm/files/pekwm-0.1.14.tar.bz2 --no-check-certificate
rm -rf pekwm-$VER;tar -xf pekwm-$VER.tar.bz2
cd pekwm-$VER

LDFLAGS="$LDFLAGS -Wl,-rpath-link=/lib" ./configure --prefix=/
make
make DESTDIR=$1 install -j1

cd ..
rm -rf pekwm-$VER
