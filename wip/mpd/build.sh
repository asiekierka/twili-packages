#!/bin/sh -e
VER=0.16.8
PNAME=mpd
EXT=tar.gz
test -e $PNAME-$VER.$EXT || wget http://downloads.sourceforge.net/project/musicpd/$PNAME/$VER/$PNAME-$VER.$EXT
rm -rf $PNAME-$VER;tar -xf $PNAME-$VER.$EXT
cd $PNAME-$VER

# Hack to fix GLib insane allocations
sed -i 's/option_no_config;/option_no_config, option_dontcare;/' src/cmdline.c
sed -i 's/on", NULL },/on", NULL}, { "nop", 0, 0, G_OPTION_ARG_NONE, \&option_dontcare, "no-op hack", NULL },/' src/cmdline.c

CFLAGS="-D_GNU_SOURCE -DM_PI_2=1.5707963268" ./configure --prefix=/
make
make DESTDIR=$1 install

cd ..
rm -rf $PNAME-$VER
mv $1/bin/mpd $1/bin/realmpd
cp mpd-hack $1/bin/mpd
chmod +x $1/bin/mpd
