#!/bin/bash

DEBUG="debug"
#DEBUG=""

GCC_PATH=`pwd`/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
export PATH=$GCC_PATH:$PATH

export USE_CCACHE=1
export CCACHE_DIR=`pwd`/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 120G

# Fix build dependency
mkdir -p prebuilts/qemu-kernel/arm
touch prebuilts/qemu-kernel/arm/LINUX_KERNEL_COPYING

source build/envsetup.sh
lunch aosp_wingray-user$DEBUG
make -j 16 otapackage 2>&1 | tee build.log
