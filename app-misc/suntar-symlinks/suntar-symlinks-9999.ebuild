# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Symlinks for packages from suntar-overlay."
HOMEPAGE="https://github.com/suntar/suntar-overlay.git"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+f77 db usleep"

DEPEND="db? ( sys-libs/db )"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

S=${WORKDIR}

src_compile() {
   if use usleep; then
     cp ${FILESDIR}/{usleep.c,Makefile} ${S}/
     make usleep
   fi
}

src_install() {

   if use f77; then
     which f77 2>/dev/null || dosym /usr/bin/gfortran /usr/bin/f77
   fi

   if use db; then
     dbh='/usr/include/db.h'
     test -h ${dbh} || $( ewarn "$dbh is not a symlink"  && die)
     dbl=`readlink -f $dbh`
     dbv=`echo $dbl | cut -d '/' -f 4 | cut -c 3-`
     test $dbl == "/usr/include/db${dbv}/db.h" || ( ewarn "unexpected symlink found: /usr/include/db.h -> $dbl"  && die )
     for i in `ls -a  /usr/bin/db${dbv}_*`; do
       p=${i#*_}
       dosym /usr/bin/db${dbv}_${p} /usr/bin/db_${p}
     done
   fi

   if use usleep; then
     which usleep 2>/dev/null || dobin ${S}/usleep
   fi
}
