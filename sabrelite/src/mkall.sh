#!/bin/bash
# URL: https://qemu.readthedocs.io/en/latest/system/arm/sabrelite.html

# armhf vs. armel vs. aarch64
# URL: https://linuxhint.com/about-arm64-armel-armhf/

# kernel
# sudo apt install gcc-arm-linux-gnueabihf
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- imx_v6_v7_defconfig
# URL: https://github.com/boundarydevices/linux-imx6/issues/67
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- boundary_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- 
qemu-system-arm -M sabrelite -smp 4 -m 1G \
    -display none -serial null -serial stdio \
    -kernel arch/arm/boot/zImage \
    -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb \
    -initrd /home/jaloo/v/qemu/qemu/busybox/busybox/rootfs.ext4 \
    -append "root=/dev/ram"

# u-boot
# sudo apt install gcc-arm-linux-gnueabihf
# sudo apt install u-boot-tools
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mx6qsabrelite_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
qemu-system-arm -M sabrelite -smp 4 -m 1G \
    -display none -serial null -serial stdio \
    -kernel u-boot

# rootfs
# busybox
# URL: https://elinux.org/QEMU
dd if=/dev/zero of=rootfs.ext4 bs=1M count=20
mkfs.ext4 rootfs.ext4
mkdir /tmp/rootfs
sudo mount -o loop rootfs.ext4 /tmp/rootfs
sudo rsync -a _install/ /tmp/rootfs
sudo chown -R root:root /tmp/rootfs/
sync
sudo umount /tmp/rootfs/
