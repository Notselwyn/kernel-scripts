#!/usr/bin/env sh

scp -i bullseye/bullseye.id_rsa -P 10021 -o "StrictHostKeyChecking no" "$1" root@localhost:/tmp/mod.ko && \
ssh -i bullseye/bullseye.id_rsa -p 10021 -o "StrictHostKeyChecking no" root@localhost "rmmod $2; insmod /tmp/mod.ko"

