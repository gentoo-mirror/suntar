# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Libraries to access PicoScope devices"
HOMEPAGE="https://labs.picotech.com/debian/pool/main/"
LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

SRC_URI="https://labs.picotech.com/debian/pool/main/libp/libpicohrdl/libpicohrdl_2.0.17-1r1441_amd64.deb \
         https://labs.picotech.com/debian/pool/main/libp/libpicoipp/libpicoipp_1.4.0-4r133_amd64.deb \
         https://labs.picotech.com/debian/pool/main/libp/libps4000/libps4000_2.1.83-2r3073_amd64.deb \
         "
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/"

src_unpack() {
  cp ${DISTDIR}/libpicohrdl_*_amd64.deb ${S}/hrdl.deb
  cp ${DISTDIR}/libpicoipp_*_amd64.deb ${S}/ipp.deb
  cp ${DISTDIR}/libps4000_*_amd64.deb ${S}/ps4000.deb
}

src_prepare() {
  default
  tmp='./data/'; mkdir -p ${tmp}

  ar x hrdl.deb
  tar xvf data.tar.* -C ${tmp}
  ar x ipp.deb
  tar xvf data.tar.* -C ${tmp}
  ar x ps4000.deb
  tar xvf data.tar.* -C ${tmp}

  # create symlinks for app-misc/pico_osc package
  cd ${S}/data/opt/picoscope/include/ && \
    mkdir pico && \
    for i in $(ls -ad */*); do ln -s /usr/include/$i pico/$(basename $i); done
}

src_install() {
  insinto /usr/include/
  doins -r ${S}/data/opt/picoscope/include/*
  insinto /usr/lib64/
  doins ${S}/data/opt/picoscope/lib/*
}
