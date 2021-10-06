# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Device2 -- a client-server system for accessing devices and programs in experimental setups."
HOMEPAGE="https://github.com/slazav/${PN}"
EGIT_REPO_URI="https://github.com/slazav/${PN}.git"
LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/jansson net-libs/libmicrohttpd net-misc/curl sci-libs/linux-gpib"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND} app-misc/suntar-symlinks[usleep]"

PATCHES=(
  "${FILESDIR}"/${PN}-gentoo.patch
)

src_prepare() {
   default
   tar xvf modules.tar >/dev/null
}

src_install() {
  dobin server/device_{c,d}
  dodir /etc/device2
  insinto /etc/device2
  doins device_{c,d}.cfg devices.cfg
  dodir /usr/share/tcl/Device2
  insinto /usr/share/tcl/Device2
  doins tcl/*
  cp "${FILESDIR}"/device_d.init.gentoo "${T}"/device_d || die
  doinitd "${T}"/device_d
}
