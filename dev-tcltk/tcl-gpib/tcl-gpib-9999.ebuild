# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="tcl-gpib interface from ROTA group"
HOMEPAGE="https://github.com/slazav/${PN}"
EGIT_REPO_URI="https://github.com/slazav/${PN}.git"
LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sci-libs/linux-gpib"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${P}/tcl-gpib


src_install() {
  mv libgpib.so libgpib.so.0
  insinto /usr/lib64/tcl/
  doins libgpib.so.0
  dosym libgpib.so.0 /usr/$(get_libdir)/tcl/libgpib.so

  cat pkgIndex.tcl.in | sed "s|%LIB_DIR%|/usr/$(get_libdir)/tcl|" > pkgIndex.tcl
  insinto /usr/share/tcl/GpibLib
  doins pkgIndex.tcl
}

