# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="graphics extension library for Tcl/Tk - library"
HOMEPAGE="https://packages.debian.org/sid/tk8.6-blt2.5"
LICENSE=""
SLOT="2.5"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
  default
  wget http://ftp.fi.debian.org/debian/pool/main/b/blt/tk8.6-blt2.5_2.5.3+dfsg-4+b1_amd64.deb
  ar x tk8.6-blt2.5_2.5.3+dfsg-4+b1_amd64.deb
  xz --decompress data.tar.xz
  mkdir -p ${PN}-${PV}
  tar xvf data.tar -C ${PN}-${PV}/
}

src_install() {
  insinto /usr/lib64/tcl8.6/
  doins usr/lib/*
  insinto /usr/lib64/tcl8.6/blt2.5/
  doins usr/lib/blt2.5/*
}
