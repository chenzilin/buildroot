#!/bin/sh
# post-build.sh for CubieBoard
# 2013, Carlo Caione <carlo.caione@gmail.com>

BOARD_DIR="$(dirname $0)"

# modify cmdline prompt in inittab
echo "export PS1='\u@\h:\w\\$ '" >> $TARGET_DIR/etc/profile

cp -r $BOARD_DIR/rootfs/. $TARGET_DIR/
