#!/bin/bash
# URL: https://gist.github.com/jlblancoc/99521194aba975286c80f93e47966dc5#file-install_gcc7_ubuntu_16-04-md
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt install g++-7 -y

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 \
                         --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --config gcc

gcc --version
g++ --version
