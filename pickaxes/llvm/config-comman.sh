#!/bin/sh
#-*- sh -*-

export LLVM_TOP=$HOME/Work/opensrc/llvm
export BUILD_TOP=$LLVM_TOP/buil
export DIST_TOP=$HOME/programs/llvm

#use gcc 4.4!
export CC=gcc-4.4
export CXX=g++-4.4

export VERSION=v3.2

mkdir -p $BUILD_TOP/$VERSION
cd $BUILD_TOP/$VERSION

$LLVM_TOP/configure --prefix=$DIST_TOP/$VERSION \
    --enable-doxygen \
    --enable-targets=host,x86,x86_64,arm \
    --enable-shared
