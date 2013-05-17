# Develop Env Setup for QEMU-VM

export PATH=/data0/usr/bin:$PATH
export LD_LIBRARY_PATH=/data0/usr/lib
for p in `ls /data0/usr/local`; do
    if [ -d /data0/usr/local/$p/lib ]; then
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data0/usr/local/$p/lib
    fi
done

export SOURCE_ROOT=/data0/source
export DEST_USR=/data0/usr
export DEST_LOCAL=$DEST_USR/local

# LuaJIT
export LUAJIT_SRC=$SOURCE_ROOT/lua
export LUAJIT_HOME=$DEST_LOCAL/luajit

# Nginx
export NGX_SRC=$SOURCE_ROOT/nginx
export NGX_DEST=$DEST_LOCAL/nginx
export PATH=$PATH:$NGX_DEST/sbin
export LUA_CPATH=$LUA_CPATH\;/usr/lib/x86_64-linux-gnu/lua/5.1/?.so

# LLVM
export LLVM_SRC_TOP=$SOURCE_ROOT/llvm
export LLVM_DEST_TOP=$DEST_LOCAL/llvm

# Postgres
export PG_SRC_ROOT=$SOURCE_ROOT/postgres
export PG_DEST_DIR=$DEST_LOCAL/postgres

# Java
export JAVA_HOME=/data0/usr/local/jdk1.6.0_34
export PATH=$JAVA_HOME/bin:$PATH
