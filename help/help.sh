#!/bin/bash
qemu-system-x86_64 -help &> qemu.help
qemu-system-x86_64 -device help &> qemu-device.help
qemu-system-x86_64 -device e1000,help &> qemu-device-e1000.help
