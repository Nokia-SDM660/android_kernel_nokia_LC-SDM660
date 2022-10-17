#!/bin/bash

pathtoclang=/root/clang
pathtogcc=/root/aarch64-linux-android-4.9
path=/root

cd
git clone https://github.com/RaghuVarma331/aarch64-linux-android-4.9.git -b master --depth=1 aarch64-linux-android-4.9
git clone https://github.com/RaghuVarma331/clang.git -b android-12.0 --depth=1 clang
cd kernel
clear
make O=out ARCH=arm64 DDV_defconfig
PATH=$pathtoclang/bin:$pathtogcc/bin:${PATH} \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-
