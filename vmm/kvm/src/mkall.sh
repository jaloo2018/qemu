#!/bin/bash
# kvm-unit-tests
# ./kvm-unit-tests/README.md
./configure
make
make tags
make cscope
