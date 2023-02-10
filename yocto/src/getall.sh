#!/bin/bash
sudo apt-get install gawk wget git diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
pylint3 xterm rsync curl zstd liblz4-dev liblz4-tool

curl https://storage.googleapis.com/git-repo-downloads/repo > ./repo
chmod a+x ./repo

mkdir imx-yocto-bsp
cd imx-yocto-bsp
../repo init -u https://source.codeaurora.org/external/imx/imx-manifest -b imx-linux-honister -m imx-5.15.5-1.0.0.xml
../repo sync
