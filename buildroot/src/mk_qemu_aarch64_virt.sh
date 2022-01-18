#!/bin/bash
cd buildroot
# doc: ./README
make list-defconfigs | grep virt
make qemu_aarch64_virt_defconfig
# make menuconfig
make 

# doc: ./board/qemu/aarch64-virt/readme.txt
qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0

