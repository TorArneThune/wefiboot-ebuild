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
IUSE="gtk"

DEPEND="gtk? ( dev-util/gtk-update-icon-cache )"
RDEPEND="${DEPEND}
	x11-libs/gksu
	x11-themes/hicolor-icon-theme
	sys-apps/systemd"

src_install() {
	dosbin wefiboot.sh
	insinto /etc
	doins wefiboot.conf
	doicon -s scalable windows-10.svg
	domenu wefiboot.desktop
}

pkg_preinst() {
	if use gtk ; then
		gnome2_icon_savelist
	fi
}

pkg_postinst() {
	if use gtk ; then
		gnome2_icon_cache_update
	fi
}

pkg_postrm() {
	if use gtk ; then
		gnome2_icon_cache_update
	fi
}
