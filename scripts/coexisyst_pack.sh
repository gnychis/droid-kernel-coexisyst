#!/bin/bash
rm -fr coexisyst_build
mkdir -p coexisyst_build/kernel
mkdir -p coexisyst_build/system/lib/modules
find . -name zImage -exec cp {} coexisyst_build/kernel/ \; &> /dev/null
find . -name "*.ko" -exec cp {} coexisyst_build/system/lib/modules/ \; &> /dev/null
cdir=$(pwd)
cd ../wlan/wl1271/platforms/os/linux
make
cd $cdir
cp ../wlan/wl1271/platforms/os/linux/tiwlan_drv.ko coexisyst_build/system/lib/modules/
cd coexisyst_build
tar cf ../kernel.tar *
cd ../
rm -fr coexisyst_build
