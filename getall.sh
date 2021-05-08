#!/bin/bash
# URL: https://www.qemu.org/download/#source
git clone https://gitlab.com/qemu-project/qemu.git
cd qemu
git submodule init
git submodule update --recursive

git pull --recurse-submodules


# .rst editor
apt install retext
