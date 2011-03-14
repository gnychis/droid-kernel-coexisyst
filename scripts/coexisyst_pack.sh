#!/bin/bash
rm -fr coexisyst_build
mkdir -p coexisyst_build/kernel
mkdir -p coexisyst_build/system/lib/modules
find . -name zImage -exec cp {} coexisyst_build/kernel/ \; &> /dev/null
find . -name "*.ko" -exec cp {} coexisyst_build/system/lib/modules/ \; &> /dev/null
cd coexisyst_build
tar cf ../kernel.tar *
cd ../
rm -fr coexisyst_build
