#!/usr/bin/env sh

export IMAGE="./image"
export IMAGE_DISK="$IMAGE/bullseye.img"
export IMAGE_MNT="$IMAGE/mnt"

qemu-system-x86_64 \
	-m 1024M \
	-kernel "$1/arch/x86/boot/bzImage" \
	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0 kasan_multi_shot=1" \
	-drive "file=$IMAGE_DISK,format=raw" \
	-netdev user,id=net0,net=192.168.76.0/24,hostfwd=tcp::10021-:22,hostfwd=tcp::8008-:8008 \
	-device virtio-net-pci,netdev=net0 \
	-device virtio-serial \
	-nographic \
	-enable-kvm \
	-smp 2 \
	-pidfile vm.pid \
	-gdb tcp::1234 \
	-virtfs "local,path=$IMAGE_MNT,mount_tag=host0,security_model=passthrough,id=host0" \
        -virtfs "local,path=/mnt,mount_tag=host1,security_model=passthrough,id=host1" \
#	2>&1 | tee vm.log
