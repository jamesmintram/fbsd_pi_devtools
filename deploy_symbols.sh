#!/usr/local/bin/zsh

set -x

source env.sh

# Kernel
scp /usr/home/james/bhyve/upb/arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/kernel.debug  pi@192.168.1.19:~/
scp /usr/home/james/bhyve/upb/arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/kernel pi@192.168.1.19:~/

# VMM
scp /home/james/bhyve/upb/arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/modules/usr/home/james/bhyve/upb/src/sys/modules/vmm/vmm.ko pi@192.168.1.19:~/
scp /home/james/bhyve/upb/arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/modules/usr/home/james/bhyve/upb/src/sys/modules/vmm/vmm.ko.debug pi@192.168.1.19:~/

cp ./arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/kernel.debug ./
cp ./arm64-workspace/obj/usr/home/james/bhyve/upb/src/arm64.aarch64/sys/FOUNDATION/kernel ./
