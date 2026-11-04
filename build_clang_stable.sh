#!/bin/bash

export CCACHE_DIR=/mnt/data-1t/ccache

ccache -M 30G

# export PATH=$PWD/prebuilts/clang/host/linux-x86/clang-r383902/bin/:$PATH
# export PATH=$PWD/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/:$PATH

# Clean previous build and create output directory
if [ -d "./out" ]; then
    rm -rf ./out
    mkdir -p ./out
fi

make ARCH=arm64 CC="ccache clang" NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip READELF=llvm-readelf OBJSIZE=llvm-size AR=llvm-ar HOSTCC=clang HOSTCXX=clang++ CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi CLANG_TRIPLE=aarch64-linux-gnu- LD=ld.lld LLVM=1 LLVM_IAS=1 ROOTDIR=$PWD O=out amar_row_lte_defconfig
make ARCH=arm64 CC="ccache clang" NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip READELF=llvm-readelf OBJSIZE=llvm-size AR=llvm-ar HOSTCC=clang HOSTCXX=clang++ CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi CLANG_TRIPLE=aarch64-linux-gnu- LD=ld.lld LLVM=1 LLVM_IAS=1 ROOTDIR=$PWD O=out -j32
