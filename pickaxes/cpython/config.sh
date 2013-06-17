#!/bin/sh

export VERSION=2.7

if [ X$CPY_SRC_ROOT = X ]; then
    export CPY_SRC_ROOT=$HOME/Work/opensrc/cpython
fi

if [ X$CPY_DEST_DIR = X ]; then
    export CPY_DEST_DIR=$HOME/programs/python-dev
fi

$CPY_SRC_ROOT/configure --prefix=$CPY_DEST_DIR/$VERSION \
    --with-threads --with-signal-module \
    --enable-profiling --with-pydebug \
    --with-valgrind
