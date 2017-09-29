# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="a minimal Markdown reading & writing app."
HOMEPAGE="http://typora.io"
SRC_URI="
  amd64? ( https://typora.io/linux/Typora-linux-x64.tar.gz )
  x86? ( https://typora.io/linux/Typora-linux-ia32.tar.gz )
"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip"
LICENSE="all-rights-reserved"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_prepare () {
	mv Typora*/* .
	rm Typora-linux*
	default
}

src_install() {
    insinto /usr/share/Typora/;
	doins -r *[^Typora];
	doins libnode.so;
	doins libffmpeg.so;
	make_desktop_entry "/usr/share/Typora/Typora" 'Typora' 'typora' 'Office';
	exeinto /usr/share/Typora;
	doexe "${S}/Typora";
}
