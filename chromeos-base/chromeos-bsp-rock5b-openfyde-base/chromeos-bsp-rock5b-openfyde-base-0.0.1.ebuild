# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="7"

inherit udev user

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="chromeos-base/chromeos-base"

RDEPEND="
    sys-kernel/armbian-firmware
    app-misc/fan-control-rock5b
    sys-boot/rock5b-loaders
    chromeos-base/os_install_service
    chromeos-base/fake-camera-config
"

DEPEND="${RDEPEND}"

S="${FILESDIR}"

src_install() {
  insinto /lib/udev/rules.d
  doins  udev/99-tun.rules
}
