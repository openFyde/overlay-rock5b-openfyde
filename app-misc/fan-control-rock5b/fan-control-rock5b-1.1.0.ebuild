# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev user
DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Fyde"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"
src_install()
{
    insinto "/etc/init"
    doins "${FILESDIR}/init/rock5-fan-control.conf"
}
