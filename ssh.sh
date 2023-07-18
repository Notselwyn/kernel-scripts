#!/usr/bin/env sh

export IMAGE="./image"
export IMAGE_PRIVKEY="$IMAGE/bullseye.id_rsa"

ssh -i "$IMAGE_PRIVKEY" -o "StrictHostKeyChecking no" -p 10021 root@127.0.0.1 "$1"
