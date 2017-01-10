# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils gnome2-utils

DESCRIPTION="Add a launcher to reboot into Windows when using EFI"
HOMEPAGE="https://github.com/TorArneThune/wefiboot"
SRC_URI="https://github.com/TorArneThune/wefiboot/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
		x11-libs/gksu
		gnome-base/gnome
		sys-apps/systemd"

src_install() {
	dosbin wefiboot.sh
	insinto /etc
	doins wefiboot.conf
	doicon -s scalable windows-10.svg
	domenu wefiboot.desktop
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
