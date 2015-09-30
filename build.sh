#!/bin/bash

export USE_CCACHE=1
export CCACHE_DIR=`pwd`/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 120G

if [ "x$1" == "x" ]; then
  products="wingray"
else
  products=$1
fi

if [ "x$2" == "xnoclean" ]; then
  noclean=1
else
  noclean=0
fi

# Fix build dependency
mkdir -p prebuilts/qemu-kernel/arm
touch prebuilts/qemu-kernel/arm/LINUX_KERNEL_COPYING

source build/envsetup.sh

if [ "x$noclean" == "x0" ]; then
  make clean
fi

for product in $products
do
  echo "lunch omni_${product}-user"
  lunch omni_${product}-user
  make -j 16 otapackage
done
