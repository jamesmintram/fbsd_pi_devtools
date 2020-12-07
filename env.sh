export BASE=${0:a:h}

#
# Tools config
export UBOOT_MKIMAGE=/usr/home/james/u-boot/tools/mkimage 

#
# Congigured per "project"
export USER=james
export NAME=arm-rng
export TARGET=arm64

#
# Kernel config
export KERNAL_CONF=GENERIC

# 
# Vars for workspace
export SRC=$BASE/src
export WORKSPACE=$BASE/arm64-workspace
export MAKEOBJDIRPREFIX=$WORKSPACE/obj/

#
# Vars for build
export NCPU=$((`sysctl -n hw.ncpu`-4))
# export __MAKE_CONF=${BASE}/make.conf

#
# Vars for "deployment" target
export ROOTBASE="/usr/home/james/tftp/"
export ROOTFS="${ROOTBASE}${NAME}"
