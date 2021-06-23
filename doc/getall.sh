#!/bin/bash
# Q35
wget https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/q35-chipset-brief.pdf
wget https://wiki.qemu.org/images/4/4e/Q35.pdf

# PCIe
wget https://wiki.qemu.org/images/f/f6/PCIvsPCIe.pdf
ln -sf ../qemu/docs/pcie.txt

# kvm: the Linux Virtual Machine Monitor
wget https://www.kernel.org/doc/ols/2007/ols2007v1-pages-225-230.pdf

# Improving the QEMU Event Loop
wget events17.linuxfoundation.org/sites/events/files/slides/Improving\ the\ QEMU\ Event\ Loop\ -\ 3.pdf

# QEMU readthedoc stable
firefox https://qemu.readthedocs.io/_/downloads/en/stable/pdf/
# QEMU readthedoc latest
firefox https://readthedocs.org/projects/qemu/downloads/pdf/latest/
