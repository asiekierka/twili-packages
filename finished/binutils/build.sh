#!/bin/sh -e
VER=2.22
TOP=$(pwd)
test -e binutils-$VER.tar.bz2 || wget http://ftp.gnu.org/gnu/binutils/binutils-$VER.tar.bz2
rm -rf binutils-$VER;tar -xf binutils-$VER.tar.bz2
cd binutils-$VER

sed -i 's/linux-gnu\* |/linux-gnu* | linux-musl* |/' config.sub
echo "#define __pid_t int" >include/features.h

./configure --target=i386-unknown-linux-musl --disable-shared --disable-nls --prefix=/
make all-binutils all-ld all-gas
make DESTDIR=$1 tooldir=/ install-binutils install-ld install-gas

for i in addr2line c++filt elfedit gprof ld ld.bfd readelf size;do
    test -e $1/bin/$i || ln -s i386-unknown-linux-musl-$i $1/bin/$i
done

cd ..
rm -rf binutils-$VER
