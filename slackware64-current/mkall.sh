#!/bin/bash
# URL: https://qemu.weilnetz.de/doc/qemu-doc.html
qemu-img create slackware64-current.img 50G

# for install with ISO
# qemu-system-x86_64 -m 2048 -hda slackware64-current.img -cdrom /home/jaloo/src/slackware64-current.iso -boot once=d
qemu-system-x86_64 -m 2048 -drive file=slackware64-current.img,index=0,media=disk,format=raw -drive file=/home/jaloo/src/slackware64-current.iso,index=1,media=cdrom -boot once=d

# run slackware
# qemu-system-x86_64 -m 2048 -hda slackware64-current.img 
qemu-system-x86_64 -m 2048 -drive file=slackware64-current.img,index=0,media=disk,format=raw

