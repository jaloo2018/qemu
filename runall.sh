#!/bin/bash
cd build/x86_64-softmmu/
./qemu-system-x86_64 -nographic

# -nographic      disable graphical output and redirect serial I/Os to console
#				  When using -nographic, press 'ctrl-a h' to get some help.

# C-a h    print this help
# C-a x    exit emulator
# C-a s    save disk data back to file (if -snapshot)
# C-a t    toggle console timestamps
# C-a b    send break (magic sysrq)
# C-a c    switch between console and monitor
# C-a C-a  sends C-a
