#!/bin/bash


ngx_run() {
    export LUAJIT_HOME=$HOME/programs/luajit
    export LUAJIT_LIB=$LUAJIT_HOME/lib
    export LUAJIT_INC=$LUAJIT_HOME/include/luajit-2.0
    export LD_LIBRARY_PATH=$LUAJIT_LIB
    export NGX_HOME=$HOME/programs/nginx
    $NGX_HOME/sbin/nginx -p $(pwd)
}

resty_run() {
    export NGX_HOME=/opt/programs/openresty/nginx
    $NGX_HOME/sbin/nginx -p $(pwd)
}

if   [ X$1 = Xresty ]
then
    echo "running openresty"
    resty_run
elif [ X$1 = Xngx ]
then
    echo "running nginx"
    ngx_run
else
    echo "bad argument"
fi
