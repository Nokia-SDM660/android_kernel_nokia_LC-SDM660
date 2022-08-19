#!/bin/bash

echo "------------------------------------------------------"
echo "Kernel Source For LC-SDM660-2019 Models"
echo "------------------------------------------------------"

path=/root

cd
mkdir black_caps
git clone https://github.com/RaghuVarma331/aarch64-linux-android-4.9.git -b master --depth=1 aarch64-linux-android-4.9
cd kernel
clear
export ARCH=arm64
export CROSS_COMPILE=$path/aarch64-linux-android-4.9/bin/aarch64-linux-android-
mkdir output
make -C $(pwd) O=output DDV_defconfig
make -j32 -C $(pwd) O=output
cp -r output/arch/arm64/boot/Image.gz-dtb $path/black_caps

