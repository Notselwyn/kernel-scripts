#!/usr/bin/env sh

export IMAGE="./image"
export IMAGE_PRIVKEY="$IMAGE/bullseye.id_rsa"

scp -i "$IMAGE_PRIVKEY" -P 10021 -o "StrictHostKeyChecking no" "$1" root@localhost:/tmp/script
ssh -i "$IMAGE_PRIVKEY" -p 10021 -o "StrictHostKeyChecking no" root@localhost "
if ! command -v python3 &>/dev/null; then
    apt update -y && apt install python3 -y
fi

cd /tmp && chmod +x ./script && TERM=$TERM ./script $2 $3 $4 $5"
