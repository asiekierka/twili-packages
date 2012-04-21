#!/bin/sh
busybox cp /bin/busybox /bin/old_busybox
busybox rm /bin/ln
busybox rm /bin/rm
busybox rm /bin/cp
busybox rm /bin/mv
busybox ln -s old_busybox /bin/ln
busybox ln -s old_busybox /bin/rm
busybox ln -s old_busybox /bin/cp
busybox ln -s old_busybox /bin/mv
