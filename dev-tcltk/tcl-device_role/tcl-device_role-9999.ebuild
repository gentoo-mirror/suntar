# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="DeviceRole library -- standardized drivers for devices"
HOMEPAGE="https://github.com/slazav/${PN}"
EGIT_REPO_URI="https://github.com/suntar/${PN}.git"
LICENSE="Unknown"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
  insinto /usr/share/tcl/DeviceRole
  doins *.tcl
}
