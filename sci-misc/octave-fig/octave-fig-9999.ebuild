# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Read data from matlab .fig format"
HOMEPAGE="https://github.com/suntar/OpenMatlabFigureInOctave/"
EGIT_REPO_URI="https://github.com/suntar/OpenMatlabFigureInOctave.git"
LICENSE="Unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sci-mathematics/octave"
DEPEND=""

src_install() {
   insinto /usr/share/octave/site/m/OpenMatlabFigureInOctave/
   doins *.m
}
