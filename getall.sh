#!/bin/bash
git clone git://git.qemu.org/qemu.git
cd qemu
git submodule init
git submodule update --recursive

git pull --recurse-submodules
