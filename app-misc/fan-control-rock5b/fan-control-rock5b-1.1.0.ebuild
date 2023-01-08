# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils toolchain-funcs git-r3

DESCRIPTION="PWM fan speed control for rock5B"
HOMEPAGE="https://github.com/pymumu/fan-control-rock5b"

EGIT_REPO_URI="https://github.com/pymumu/fan-control-rock5b"
EGIT_COMMIT="8419990c6c0f47a3ed0b55255d7e3591cc5fdab9"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare()
{
    eapply_user
    eapply ${FILESDIR}/001-remove-systemd.patch
}
src_compile()
{
    tc-export BUILD_PKG_CONFIG
    emake FAN_CONTROL_BIN
}

src_install()
{
    exeinto "/usr/bin"
    doexe "${S}/src/fan-control"
    insinto "/etc/"
    doins "${S}/etc/fan-control.json"
    insinto "/usr/share/rock5b"
    doins "${FILESDIR}/init/rock5-fan-control.conf"
}
