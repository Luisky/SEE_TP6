#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

umount /dev/sda1 /dev/sda2
mkfs.vfat –F 16 –n boot /dev/sda1
mkfs.ext4 –L rootfs –E nodiscard /dev/sda2

if [ $? = 1 ]
then
        echo "error: is SD card plugged in ?"
        exit 1
fi

echo "pcmsim.ko updated on SD card"

exit 0

