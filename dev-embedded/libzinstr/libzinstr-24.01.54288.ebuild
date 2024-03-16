# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="LabOne libraries to access Zurich Instrument devices"
HOMEPAGE="https://www.zhinst.com/europe/en/support/download-center"
LICENSE="BSD MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

SRC_URI="https://download.zhinst.com/${PV}/LabOneLinux64-${PV}.tar.gz"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

S="${WORKDIR}/"

src_unpack() {
  cp ${DISTDIR}/LabOneLinux64-*.tar.gz ${S}/LabOneLinux64.tar.gz
  tar xvf LabOneLinux64.tar.gz
}

src_prepare() {
  default
  mv ${S}/LabOneLinux64-${PV} ${S}/ziLabOne
  ln -s /usr/lib64/libziAPI-linux64.so ${S}/ziLabOne/API/C/lib/libzi.so
}

src_install() {
  insinto /opt/
  doins -r ${S}/ziLabOne
  insinto /usr/include/
  doins ${S}/ziLabOne/API/C/include/ziAPI.h
  insinto /usr/lib64/
  doins ${S}/ziLabOne/API/C/lib/lib*.so
  into /usr/
  dobin ${S}/ziLabOne/DataServer/zi{Data,}Server
  dobin ${S}/ziLabOne/WebServer/ziWebServer
  insinto /etc/init.d/
  insopts -m0755
  doins ${FILESDIR}/zi{data,web}*
}
