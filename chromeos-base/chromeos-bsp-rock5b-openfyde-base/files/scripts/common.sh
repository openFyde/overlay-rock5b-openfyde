#!/bin/bash

ENV_FILE=/mnt/stateful_partition/fyde/Env.txt

ROCK5B="rock5b"
ROCK5BPLUS="rock5bplus"
ROCK5T="rock5t"
DEFAULT_BOARD="$ROCK5B"

BOARD=""

declare -A dtb_rmap=(
    ["rk3588-rock-5b.dtb"]="$ROCK5B"
    ["rk3588-rock-5b-plus.dtb"]="$ROCK5BPLUS"
    ["rk3588-rock-5t.dtb"]="$ROCK5T"
)


dtb="$(cat "$ENV_FILE" | grep fdtfile | sed 's/fdtfile=//g')"

if [ -z "${dtb_rmap[$dtb]}" ]; then
    BOARD=$DEFAULT_BOARD
else
    BOARD=${dtb_rmap[$dtb]}
fi
