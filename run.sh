#!/usr/bin/env sh

export IMAGE="./image"
export IMAGE_DISK="$IMAGE/bullseye.img"

qemu-system-x86_64 \
	-m 1024M \
	-kernel "$1/arch/x86/boot/bzImage" \
	-append "console=ttyS0 root=/dev/sda earlyprintk=serial nokaslr net.ifnames=0 kasan_multi_shot=1" \
	-drive "file=$IMAGE_DISK,format=raw" \
	-netdev user,id=net0,hostfwd=tcp::10021-:22 \
	-device e1000,netdev=net0 \
	-enable-kvm \
	-nographic \
	-pidfile vm.pid \
	-gdb tcp::1234 \
	2>&1 | tee vm.log
