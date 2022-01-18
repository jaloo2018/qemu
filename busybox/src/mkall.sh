#!/bin/bash
# busybox
# sudo apt install gcc-arm-linux-gnueabihf
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
# CONFIG_STATIC=y
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- install
cd _install
sudo cp -a /usr/arm-linux-gnueabihf/lib .
# clean
make distclean


# uclibc-ng
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
# CONFIG_ARM_EABI=y
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
# URL: https://www.mail-archive.com/devel@uclibc-ng.org/msg00559.html
