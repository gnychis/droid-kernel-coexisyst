#!/bin/bash
cp /home/gnychis/Documents/android-ndk-r5b/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-gcc /tmp/tgcc
cp /home/gnychis/Documents/android-ndk-r5b/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-thegcc /home/gnychis/Documents/android-ndk-r5b/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-gcc
export KERNEL_DIR=/home/gnychis/Documents/android/droid/omap
export ARCH=arm
export CROSS_COMPILE=/home/gnychis/Documents/android/droid/prebuilt/linux-x86/toolchain/arm-eabi-4.4.0/bin/arm-eabi-
make -j4
rm -fr coexisyst_build
mkdir -p coexisyst_build/kernel
mkdir -p coexisyst_build/system/lib/modules
find . -name zImage -exec cp {} coexisyst_build/kernel/ \; &> /dev/null
find . -name "*.ko" -exec cp {} coexisyst_build/system/lib/modules/ \; &> /dev/null
cdir=$(pwd)
cd ../wlan/wl1271/platforms/os/linux
make clean
make
cd $cdir
cd ../compat-wireless-2011-05-01
./make.sh
find . -name "*.ko" -exec cp {} ../omap/coexisyst_build/system/lib/modules/ \;
cd $cdir
cp ../wlan/wl1271/platforms/os/linux/tiwlan_drv.ko coexisyst_build/system/lib/modules/
cd coexisyst_build
tar cf ../kernel.tar *
cd ../
rm -fr coexisyst_build
cp /tmp/tgcc /home/gnychis/Documents/android-ndk-r5b/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-gcc
