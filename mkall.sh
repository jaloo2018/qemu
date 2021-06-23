#!/bin/bash
cd qemu
# make ctags
# make cscope
mkdir build
cd build
../configure --target-list=x86_64-softmmu --enable-debug 2>&1 | tee configure.log
make 2>&1 | tee make.log
sudo make install

