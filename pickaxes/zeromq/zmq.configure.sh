#!/bin/sh


#  ZMQ_SRC
if [ X$ZMQ_SRC = X ]; then
    export ZMQ_SRC=$HOME/Work/opensrc/zeromq/zeromq2-x
fi

#  ZMQ_DEST
if [ X$ZMQ_DEST = X ]; then
    export ZMQ_DEST=$HOME/programs/zeromq
fi

if [ X$ZMQ_VERSION = X ]; then
    export ZMQ_VERSION=v2.1.7
fi

cd $ZMQ_SRC
git co $ZMQ_VERSION
if [ X$? = X0 ]; then
    ./configure --prefix=$ZMQ_DEST/$ZMQ_VERSION
else
    echo ERROR VERSION!
fi
