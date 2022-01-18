#!/bin/bash
# URL: https://wiki.boundarydevices.com/index.php/BD-SL-i.MX6

# u-boot: boundary-v2020.10
git clone https://github.com/boundarydevices/u-boot-imx6.git
git checkout -b boundary-v2020.10 remotes/origin/boundary-v2020.10

# kernel: boundary-imx_5.10.x_2.0.0
git clone https://github.com/boundarydevices/linux-imx6.git
git checkout -b boundary-imx_5.10.x_2.0.0 remotes/origin/boundary-imx_5.10.x_2.0.0

