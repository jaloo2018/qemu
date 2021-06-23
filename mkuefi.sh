#!/bin/bash
cd qemu

# EDK2
cd roms/edk2
git submodule init
git submodule update --recursive
# git pull --recurse-submodules

# URL: https://wiki.ubuntu.com/UEFI/EDK2
make -C BaseTools/

# OVMF
# URL: https://github.com/tianocore/tianocore.github.io/wiki/How-to-build-OVMF

# vi Conf/target.txt
# ACTIVE_PLATFORM       = OvmfPkg/OvmfPkgX64.dsc
# TARGET_ARCH           = X64
# TOOL_CHAIN_TAG        = GCC5

# sudo apt install nasm iasl

source edksetup.sh
build
# build -DDEBUG_ON_SERIAL_PORT=TRUE
# build -DSECURE_BOOT_ENABLE=TRUE
ls -lh ./Build/OvmfX64/DEBUG_GCC5/FV/OVMF.fd

# URL: https://wiki.ubuntu.com/UEFI/OVMF


