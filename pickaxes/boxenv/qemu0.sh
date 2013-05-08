# Develop Env Setup for QEMU-VM

export SOURCE_ROOT=/data0/source
export DEST_USR=/data0/usr
export DEST_LOCAL=$DEST_USR/local

# LuaJIT
export LUAJIT_SRC=$SOURCE_ROOT/lua
export LUAJIT_HOME=$DEST_LOCAL/luajit

# Nginx
export NGX_SRC=$SOURCE_ROOT/nginx
export NGX_DEST=$DEST_LOCAL/nginx

#LLVM
export LLVM_SRC_TOP=$SOURCE_ROOT/llvm
export LLVM_DEST_TOP=$DEST_LOCAL/llvm

#Postgres
export PG_SRC_ROOT=$SOURCE_ROOT/postgres
export PG_DEST_DIR=$DEST_LOCAL/postgres
