#!/usr/bin/env sh

export IMAGE="./image"

mkdir "$IMAGE"
cd "$IMAGE/"
wget https://raw.githubusercontent.com/google/syzkaller/master/tools/create-image.sh -O create-image.sh
chmod +x create-image.sh
./create-image.sh
