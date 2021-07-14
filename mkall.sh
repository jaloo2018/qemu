#!/bin/bash
cd qemu
# make ctags
# make cscope
mkdir build
cd build
../configure --target-list=x86_64-softmmu --enable-debug 2>&1 | tee configure.log
make 2>&1 | tee make.log
sudo make install 2>&1 | tee install.log


# Warning, treated as error:
# ../docs/qemu-option-trace.rst.inc:4:Malformed option description '[enable=]PATTERN', should look like "opt", "-opt args", "--opt args", "/opt args" or "+opt args"
# URL: https://www.mail-archive.com/qemu-devel@nongnu.org/msg723079.html

