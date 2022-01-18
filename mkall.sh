#!/bin/bash
cd qemu
# make ctags
# make cscope
mkdir build
cd build
# ../configure --help &> configure.help
# ../configure --target-list=x86_64-softmmu --enable-debug 2>&1 | tee configure.log
# sudo apt install gcc-7
../configure --enable-debug 2>&1 | tee configure.log
../configure --enable-debug --enable-profiler 2>&1 | tee configure_debug_profiler.log
make 2>&1 | tee make.log
sudo make install 2>&1 | tee install.log


# Warning, treated as error:
# ../docs/qemu-option-trace.rst.inc:4:Malformed option description '[enable=]PATTERN', should look like "opt", "-opt args", "--opt args", "/opt args" or "+opt args"
# URL: https://www.mail-archive.com/qemu-devel@nongnu.org/msg723079.html
vi ../docs/qemu-option-trace.rst.inc
+.. option:: -trace


# tracing
# docs/devel/tracing.txt
../configure --enable-debug --enable-trace-backends=simple 2>&1 | tee configure_enable-debug_enable-trace-backends-simple.log
make -s
sudo make install
echo vm_state_notify > /tmp/events
qemu --trace events=/tmp/events
