#!/usr/bin/env sh

export IMAGE="./image"
export IMAGE_PRIVKEY="$IMAGE/bullseye.id_rsa"

scp -i "$IMAGE_PRIVKEY" -P 10021 -o "StrictHostKeyChecking no" "$1" root@localhost:/tmp/script
ssh -i "$IMAGE_PRIVKEY" -p 10021 -o "StrictHostKeyChecking no" root@localhost 'apt update -y && apt install python3 -y && cd /tmp && chmod +x ./script && ./script'
