#!/bin/bash
# URL: https://qemu.readthedocs.io/en/latest/system/arm/virt.html

# URL: https://github.com/ARM-software/u-boot/blob/master/doc/README.qemu-arm
- For ARM:
    make qemu_arm_defconfig
    make

- For AArch64:
    make qemu_arm64_defconfig
    make

Running U-Boot
--------------
The minimal QEMU command line to get U-Boot up and running is:

- For ARM:
    qemu-system-arm -machine virt -bios u-boot.bin

- For AArch64:
    qemu-system-aarch64 -machine virt -cpu cortex-a57 -bios u-boot.bin
