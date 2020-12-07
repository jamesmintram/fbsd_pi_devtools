#!/usr/local/bin/zsh

#

set -x
source env.sh

mkdir -p $ROOTFS $MAKEOBJDIRPREFIX

cd $SRC

make -j $NCPU -DWITHOUT_CLEAN buildkernel KERNCONF=$KERNAL_CONF || exit $?
make -j $NCPU -DWITHOUT_CLEAN buildworld || exit $?