#!/bin/bash

ENV_FILE=/mnt/stateful_partition/fyde/Env.txt
SECTOR_SIZE=512
# should be same as write location
BOARD_MAGIC_SECTOR=65597
COUNT=4
rootdev=""

err()
{
    echo "$@" > /dev/kmsg
    exit 1
}

declare -A dtb_map=(
    ["RK5B"]="rk3588-rock-5b.dtb"
    ["RK5+"]="rk3588-rock-5b-plus.dtb"
    ["RK5T"]="rk3588-rock-5t.dtb"
)

board=""

rootdev="$(findmnt -n -o source / | sed 's/p[0-9]//g')"

mkdir -p "$(dirname $ENV_FILE)" || true

offset=$(( SECTOR_SIZE * BOARD_MAGIC_SECTOR ))
_board="$(dd if="$rootdev" bs=1 skip=$offset count=$COUNT 2>/dev/null)"
dtb="${dtb_map[$_board]}"

[ -z "$dtb" ] && err "can't recognize board type from $rootdev offset $offset"
echo "fdtfile=rockchip/$dtb" >> $ENV_FILE
