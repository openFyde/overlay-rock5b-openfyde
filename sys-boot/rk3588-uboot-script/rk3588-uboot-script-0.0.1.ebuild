# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="7"

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}
  virtual/linux-sources
"

S=${WORKDIR}

src_compile() {
  if [ -z "${ROCKCHIP_DTS}" ]; then
    die "Need set ROCKCHIP_DTS in make.conf"
  fi
  for slot in A B; do
    cat ${FILESDIR}/boot-${slot}.cmd | sed -e "s/#ROCKCHIP_DTS#/${ROCKCHIP_DTS}/g" > boot-${slot}.cmd
    ${FILESDIR}/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
      -n "boot" -d boot-${slot}.cmd boot-${slot}.scr.uimg || die
  done
}

src_install() {
  insinto /boot
  doins *.scr.uimg
}
