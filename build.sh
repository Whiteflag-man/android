#!/bin/bash

export USE_CCACHE=1
export CCACHE_DIR=`pwd`/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 120G
# Fix build dependency
mkdir -p prebuilts/qemu-kernel/arm
touch prebuilts/qemu-kernel/arm/LINUX_KERNEL_COPYING

source build/envsetup.sh
brunch wingray
