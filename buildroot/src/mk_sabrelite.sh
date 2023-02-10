#!/bin/bash
cd buildroot
# doc: ./README
make list-defconfigs | grep nitrogen
# doc: ./board/boundarydevices/common/readme.txt
make nitrogen6x_defconfig
# make menuconfig
make 
# https://qemu.readthedocs.io/en/latest/system/arm/sabrelite.html
# Running Linux kernel
# qemu-system-arm -s -S -M sabrelite -smp 4 -m 1G \
#     -display none -serial null -serial stdio \
#     -kernel output/images/zImage \
#     -dtb output/images/imx6q-sabrelite.dtb \
#     -initrd output/images/rootfs.ext4 \
#     -append "root=/dev/ram"

gdb-multiarch
(gdb) target remote localhost:1234
(gdb) r

gdb-multiarch --args qemu-system-arm \
	--M sabrelite -smp 4 -m 1G		\
	-display none -serial null -serial stdio	\
	-kernel output/images/zImage	\
	-dtb output/images/imx6q-sabrelite.dtb	\
	-initrd output/images/rootfs.ext4	\
	-append "root=/dev/ram"

# Running U-Boot
qemu-system-arm -M sabrelite -smp 4 -m 1G \
    -display none -serial null -serial stdio \
    -kernel u-boot


# WARNING: CPU: 1 PID: 82 at arch/arm/mach-imx/busfreq-imx.c:172 busfreq_notify+0x78/0x98
# URL: https://community.nxp.com/t5/i-MX-Processors/How-to-disable-DDR-BUS-frequency-scaling-from-kernel-space/td-p/975643
echo "0" > /sys/devices/platform/soc/soc:busfreq/enable
cat /sys/devices/platform/soc/soc\:busfreq/enable 
# Bus frequency scaling is disabled

# imx:busfreq: disable busfreq driver by default 
# URL: https://git.congatec.com/arm/imx6_kernel_3.14/-/commit/ea53bf7f19c0e4c0e9d90d1e8b86616708e5867b
output/build/linux-custom/arch/arm/mach-imx/busfreq-imx.c
-	bus_freq_scaling_is_active = 1;
+	bus_freq_scaling_is_active = 0;
	bus_freq_scaling_initialized = 1;

# URL: https://stackoverflow.com/questions/50400698/buildroot-linux-kernel-clean-build
make linux-rebuild

# strace
strace qemu-system-arm -M sabrelite -smp 4 -m 1G \
    -display none -serial null -serial stdio \
    -kernel output/images/zImage \
    -append "root=/dev/ram0" \
    -initrd output/images/rootfs.ext4 \
    -dtb output/images/imx6q-sabrelite.dtb 2>&1 | tee jaloo.strace_imx6_src

qemu-system-arm -M sabrelite -smp 4 -m 1G \
    -display none -serial null -serial stdio \
    -kernel output/images/zImage \
    -append "root=/dev/ram0" \
    -initrd output/images/rootfs.ext4 \
    -dtb output/images/imx6q-sabrelite.dtb
