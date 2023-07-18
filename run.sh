#!/usr/bin/env sh

export IMAGE="./image"
export IMAGE_DISK="$IMAGE/bullseye.img"

qemu-system-x86_64 \
	-m 1024M \
	-kernel "$1/arch/x86/boot/bzImage" \
	-append "console=ttyS0 root=/dev/sda earlyprintk=serial nokaslr net.ifnames=0 kasan_multi_shot=1" \
	-drive "file=$IMAGE_DISK,format=raw" \
	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22,hostfwd=tcp:127.0.0.1:445-:445 \
	-net nic,model=e1000 \
	-enable-kvm \
	-nographic \
	-pidfile vm.pid \
	-gdb tcp::1234 \
	2>&1 | tee vm.log
	# -append "console=ttyS0 root=/dev/sda earlyprintk=serial nokaslr net.ifnames=0"
        #-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22,hostfwd=tcp:127.0.0.1:10445-:445 \
