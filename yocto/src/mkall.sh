#!/bin/bash
DISTRO=fsl-imx-fb MACHINE=nitrogen6x source imx-setup-release.sh -b build-fb
bitbake core-image-minimal
