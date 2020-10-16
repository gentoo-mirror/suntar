# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Magneetti - calculate cylindrically-symmetric magnets."
HOMEPAGE="https://github.com/slazav/${PN}"
EGIT_REPO_URI="https://github.com/slazav/${PN}.git"
EGIT_SUBMODULES=()
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-misc/suntar-symlinks[f77(+)]"


src_compile() {
   emake
}

src_install() {
  dobin magnet magnet_new magnet_plot magneettiSH magneettiUI
}
