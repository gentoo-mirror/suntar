# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Graphene -- a simple time-series database with nanosecond precision for scientific applications."
HOMEPAGE="https://github.com/slazav/${PN}"
EGIT_REPO_URI="https://github.com/slazav/${PN}.git"
EGIT_SUBMODULES=()
LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sys-libs/db dev-libs/jansson net-libs/libmicrohttpd"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_compile() {
   tar xvf modules.tar
   emake -C graphene
}

src_install() {
  dobin graphene/{graphene,graphene_http}
  dobin graphene/scripts/*
  cp "${FILESDIR}"/graphene_http.init.gentoo "${T}"/graphene_http || die
  doinitd "${T}"/graphene_http
}
