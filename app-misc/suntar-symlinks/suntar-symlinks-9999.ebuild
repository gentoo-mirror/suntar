# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Symlinks for packages from suntar-overlay."
HOMEPAGE="https://github.com/suntar/suntar-overlay.git"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+f77"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
   if use f77; then
     which f77 || dosym /usr/bin/gfortran /usr/bin/f77
   fi
}
