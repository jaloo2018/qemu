#!/bin/bash
qemu-img create slackware64-current.img 50G
qemu-system-x86_64 -m 2048 -hda slackware64-current.img -cdrom /home/jaloo/src/slackware64-current.iso -boot d
