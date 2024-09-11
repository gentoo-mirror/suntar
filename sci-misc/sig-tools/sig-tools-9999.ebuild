# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Process oscilloscope data written in .sig format."
HOMEPAGE="https://github.com/slazav/pico_osc/"
EGIT_REPO_URI="https://github.com/suntar/${PN}.git"
LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-tcltk/itcl
	dev-tcltk/blt[X]
"
BDEPEND="sci-libs/fftw"

src_prepare() {
  default
  sed -i -e "s|%LIB_DIR%|/usr/$(get_libdir)/tcl/|" sig_viewer/pkgIndex.tcl || die
  sed -i -e 's|^load ./sig_load.so|package require SigLoad|' sig_viewer/sig_viewer || die
}

src_compile() {
   emake -j1
}

src_install() {
  dobin sig_filter/{sig_filter,sig_info,sig_pnmtopng,sig_pnginfo}
  dobin sig_viewer/sig_viewer

  insinto /usr/$(get_libdir)/tcl/
  doins sig_viewer/sig_load.so

  insinto /usr/share/tcl/SigLoad/
  doins sig_viewer/pkgIndex.tcl
}

