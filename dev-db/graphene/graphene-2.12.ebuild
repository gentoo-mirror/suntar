# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Graphene -- a simple time-series database with nanosecond precision for scientific applications."
HOMEPAGE="https://github.com/slazav/${PN}"
EGIT_REPO_URI="https://github.com/slazav/${PN}.git"
EGIT_COMMIT=2764551673eb4dcd83a46fbe8e783ba21e5b9f71

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/db dev-libs/jansson net-libs/libmicrohttpd"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"


src_compile() {
   export CPPFLAGS="${CPPFLAGS} -fpermissive"
   which db_dump || \
       ( ewarn "db_dump is needed for running make_tests " \
         && ewarn "package app-misc/suntar-symlinks[db] provides symlinks for db_* programs"  \
         && die )
   emake -j1
}

src_install() {
  dobin graphene/{graphene,graphene_http}
  dobin scripts/graphene_{filter,int,mkcomm,sweeps,sync}
  cp "${FILESDIR}"/graphene_http.init.gentoo "${T}"/graphene_http || die
  dodir /var/lib/graphene
  doinitd "${T}"/graphene_http
  insinto /usr/share/graphene/tcllib/
  doins graphene/tcllib/*.tcl
}
