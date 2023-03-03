#!/bin/sh

LOADER_DIR=/usr/share/rock5b

main() {
 local target="$1"
 local type="$2" # ignored
 local zero="${LOADER_DIR}/zero.img"
 local loader="${LOADER_DIR}/spi.img"

 echo "installing $loader to $target"
 dd if=$zero of=$target status=progress bs=1024 conv=fdatasync,notrunc
 dd if=$loader of=$target status=progress bs=1024 conv=fdatasync,notrunc
 echo "done"
}

main "$@"
