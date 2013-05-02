
export QEMU_X64=qemu-system-x86_64
export QEMU_X86=qemu-system-i386
export QEMU_ARM=qemu-system-arm

export HDDROOT=$HOME/Work/qemu
export HDD_DEBIAN64=$HDDROOT/debian64.vdi

export DEFAULT_NET_OPT="-net nic -net user"
#-net tap,ifname=tap1

export BUILD_DIR_QEMU_36=/opt/kernel/build/3.6-qemu/build
export X86_IMAGE=arch/x86/boot/bzImage

$QEMU_X64 -enable-kvm \
    -kernel $BUILD_DIR_QEMU_36/$X86_IMAGE  \
    -hda $HDD_DEBIAN64 -append "root=/dev/sda1" \
    $DEFAULT_NET_OPT
