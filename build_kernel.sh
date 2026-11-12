#!/bin/bash

export PATH=$PWD/prebuilts/clang/host/linux-x86/ZyClang-16/bin/:$PATH

# Clean previous build and create output directory
if [ -d "./out" ]; then
    rm -rf ./out
    mkdir -p ./out
fi

make ARCH=arm64 CC="ccache clang" NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip READELF=llvm-readelf OBJSIZE=llvm-size AR=llvm-ar HOSTCC=clang HOSTCXX=clang++ CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi CLANG_TRIPLE=aarch64-linux-gnu- LD=ld.lld LLVM=1 LLVM_IAS=1 ROOTDIR=$PWD O=out amar_row_lte_defconfig
make ARCH=arm64 CC="ccache clang" NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip READELF=llvm-readelf OBJSIZE=llvm-size AR=llvm-ar HOSTCC=clang HOSTCXX=clang++ CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi CLANG_TRIPLE=aarch64-linux-gnu- LD=ld.lld LLVM=1 LLVM_IAS=1 ROOTDIR=$PWD O=out -j32
