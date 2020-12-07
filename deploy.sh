#!/usr/local/bin/zsh

set -x

source env.sh

# cp /usr/home/james/bhyve/upb/arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/kernel ~/tftp/uboot-oct/boot/kernel/kernel
# cp ./arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/kernel.debug ./
# cp ./arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/kernel ./


cd $SRC
make -DWITHOUT_TESTS DESTDIR=$ROOTFS installworld || exit $?
make -DWITHOUT_TESTS DESTDIR=$ROOTFS installkernel KERNCONF=$KERNAL_CONF || exit $?

# TODO: Only use this occasionally
# make -DWITHOUT_TESTS DESTDIR=$ROOTFS distribution 

# Ensure our target's config overlays are up to date
cd $ROOTFS
mkdir -p conf/base
tar -c -v -f conf/base/etc.cpio.gz --format cpio --gzip etc
tar -c -v -f conf/base/var.cpio.gz --format cpio --gzip var

# Build our u-boot boot script
${UBOOT_MKIMAGE} -T script -C none -n'Default boot' -d ${BASE}/boot.scr ${ROOTFS}/boot.scr.uimg

# Build and deploy the dnsmasq config

sed "s|tftp-root=|tftp-root=$ROOTFS|" ${BASE}/dnsmasq.conf > ${ROOTFS}/dnsmasq.conf
