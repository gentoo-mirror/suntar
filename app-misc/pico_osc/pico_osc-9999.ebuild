# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Record signals with Picoscope devices."
HOMEPAGE="https://github.com/slazav/${PN}"
EGIT_REPO_URI="https://github.com/suntar/${PN}.git"
LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-embedded/libpico
	dev-libs/libusb
	dev-libs/jansson
"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_prepare() {
  default
}

src_compile() {
   emake -j1
}

src_install() {
  dobin pico_adc/pico_adc
  dobin pico_osc/pico_osc
}

