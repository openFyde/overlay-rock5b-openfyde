#!/bin/bash

LOADER_DIR=/usr/share/rock5b

main() {
 local target="$1"
 local type="$2" # ignored
 local zero="${LOADER_DIR}/zero.img"
 local loader="${LOADER_DIR}/spi.img"

 local target_md5="$(md5sum ${target} | awk '{print $1}')"
 local loader_md5="$(md5sum ${loader} | awk '{print $1}')"

 if [ "$target_md5" != "$loader_md5" ]; then
     echo "installing $loader to $target"
 #    dd if=$zero of=$target status=progress bs=1024 conv=fdatasync,notrunc
     dd if=$loader of=$target status=progress bs=1024 conv=fdatasync,notrunc
     echo "done"
 fi
}

main "$@"
