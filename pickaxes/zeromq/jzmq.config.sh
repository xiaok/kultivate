#!/bin/sh

# JZMQ_DEST
if [ X$JZMQ_DEST = X ]; then
    export JZMQ_DEST=$HOME/programs/zeromq/jzmq
fi

#  ZMQ_PREFIX

if [ X$ZMQ_DEST = X ]; then
    export ZMQ_DEST=$HOME/programs/zeromq
fi

if [ X$ZMQ_VERSION = X ]; then
    export ZMQ_VERSION=v2.1.7
fi

#  JZMQ_SRC
if [ X$JZMQ_SRC = X ]; then
    export JZMQ_SRC=$HOME/Work/opensrc/zeromq/jzmq
fi

cd $JZMQ_SRC
./configure --prefix=$JZMQ_DEST \
    --with-zeromq=$ZMQ_DEST/$ZMQ_VERSION
