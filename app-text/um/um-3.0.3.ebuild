# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Create and maintain your own man pages so you can remember how to do stuff"
HOMEPAGE="https://github.com/sinclairtarget/um"
SRC_URI="https://github.com/sinclairtarget/um/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/pandoc dev-lang/ruby"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodir /usr/share/um
	dodir /usr/share/um/bin
	insinto /usr/share/um
	exeinto /usr/share/um/bin
	for i in *; do
		test "$i" != "bin" && doins -r $i;
	done
	doexe ${S}/bin/um
	dosym /usr/share/um/bin/um /usr/bin/um
}
