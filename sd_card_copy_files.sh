#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

cd /home/luisky/TP5-9/buildroot/output/images/
cp -t /media/luisky/boot/ MLO am335x-boneblack.dtb u-boot.img uEnv.txt zImage
tar -C /media/luisky/rootfs/ -xf rootfs.tar

if [ $? = 1 ]
then
        echo "error: is SD card plugged in ?"
        exit 1
fi

echo "updated SD card"

exit 0

