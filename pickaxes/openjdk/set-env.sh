#!/bin/sh

if [ X$OPENJDK = X ]; then
    export OPENJDK=$HOME/Work/opensrc/openjdk
fi

if [ X$ANT_HOME = X ]; then
    export ANT_HOME=$HOME/programs/ant
fi

export LANG=C

if [ X$JAVA_HOME = X ]; then
    export ALT_BOOTDIR=/opt/programs/jdk1.6.0_34
    export ALT_JDK_IMPORT_PATH=/opt/programs/jdk1.6.0_34
else
    export ALT_BOOTDIR=$JAVA_HOME
    export ALT_JDK_IMPORT_PATH=$JAVA_HOME
    unset JAVA_HOME
fi


export ALT_BINARY_PLUGS_PATH=$OPENJDK/openjdk-binary-plugs

export HOTSPOT_BUILD_JOBS=2
export OPENJDK=true

# OPTIONS:
export BUILD_DEPLOY=false
# export BUILD_HEADLESS=true
export BUILD_CORBA=false
# for JAXP/JAXWS
# export ALLOW_DOWNLOADS=true
export BUILD_JAXP=false
export BUILD_JAXWS=false

#MAKE COMMANDS:
# 1. make all
# 2. make debug_build
# 3. make fastdebug_build
# ...
