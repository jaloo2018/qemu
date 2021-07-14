#!/bin/bash
# doc: capstone/COMPILE.TXT
cd capstone
# vi config.mk
./make.sh
sudo ./make.sh install
# mkdir -p /usr/lib
# install -m0755 ./libcapstone.so.5 /usr/lib
# cd /usr/lib && rm -f libcapstone.so && ln -s libcapstone.so.5 libcapstone.so
# install -m0644 ./libcapstone.a /usr/lib
# mkdir -p /usr/include/capstone
# install -m0644 include/capstone/*.h /usr/include/capstone
# mkdir -p /usr/lib/pkgconfig
# install -m0644 ./capstone.pc /usr/lib/pkgconfig
# mkdir -p /usr/bin
# install -m0755 cstool/cstool /usr/bin

./tests/test*

sudo ./make.sh uninstall
