#!/bin/sh
#-*- sh -*-

if [ X$LLVM_SRC_TOP = X ]; then
    export LLVM_SRC_TOP=$HOME/Work/opensrc/llvm
fi

if [ X$LLVM_DEST_TOP = X ]; then
    export LLVM_DEST_TOP=$HOME/programs/llvm
fi

if [ X$LLVM_VERSION = X ]; then
    # default version
    export LLVM_VERSION=v3.2
fi


export LLVM_BUILD_TOP=$LLVM_SRC_TOP/build

#use gcc 4.4!
export CC=gcc-4.4
export CXX=g++-4.4

mkdir -p $LLVM_BUILD_TOP/$LLVM_VERSION
cd $LLVM_BUILD_TOP/$LLVM_VERSION

$LLVM_SRC_TOP/configure --prefix=$LLVM_DEST_TOP/$LLVM_VERSION \
    --enable-targets=host,x86,x86_64,arm \
    --enable-shared \
    $@

#other options:
# --enable-optimized # -or-> make ENABLE_OPTIMIZED=1
# --enable-doxygen \
