#!/bin/sh
#
# script to bring up the tun device in QEMU in bridged mode
# first parameter is name of tap device (e.g. tap0)
#
# some constants specific to the local host - change to suit your host
#
ETH0IP=192.168.7.3
GATEWAY=192.168.7.1
BROADCAST=192.168.7.255
#
# First take eth0 down, then bring it up with IP 0.0.0.0
#
/sbin/ifdown eth0
/sbin/ifconfig eth0 0.0.0.0 promisc up
#
# Bring up the tap device (name specified as first argument, by QEMU)
#
/usr/sbin/openvpn --mktun --dev $1 --user kdr2 #`id -un`
/sbin/ifconfig $1 0.0.0.0 promisc up
#
# create the bridge between eth0 and the tap device
#
/sbin/brctl addbr br0
/sbin/brctl addif br0 eth0
/sbin/brctl addif br0 $1
#
# only a single bridge so loops are not possible, turn off spanning tree protocol
#
/sbin/brctl stp br0 off
#
# Bring up the bridge with ETH0IP and add the default route
#
/sbin/ifconfig br0 $ETH0IP netmask 255.255.255.0 broadcast $BROADCAST
#/sbin/route add default gw $GATEWAY
#
# stop firewall - comment this out if you don't use Firestarter
#
#/sbin/service firestarter stop
