# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="tcl-xblt library from ROTA group"
HOMEPAGE="https://github.com/slazav/${PN}"
EGIT_REPO_URI="https://github.com/slazav/${PN}.git"
LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
  insinto /usr/share/tcl/tcl-xblt
  doins tcl-xblt/*.tcl
}
