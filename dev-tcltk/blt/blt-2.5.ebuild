# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="graphics extension library for Tcl/Tk - library"
HOMEPAGE="https://packages.debian.org/sid/tk8.6-blt2.5"
LICENSE=""
SLOT="2.5"
KEYWORDS=""
IUSE=""

SRC_URI="http://ftp.fi.debian.org/debian/pool//main/b/blt/tk8.6-blt2.5_2.5.3+dfsg-4+b1_amd64.deb"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
  default
  tar xvf data.tar.xz
}

src_install() {
  insinto /usr/lib64/tcl8.6/
  doins ${S}/usr/lib/*
  insinto /usr/lib64/tcl8.6/blt2.5/
  doins ${S}/usr/lib/blt2.5/*
  dodoc ${S}/usr/share/doc/tk8.6-blt2.5/{copyright,changelog.gz}
}
