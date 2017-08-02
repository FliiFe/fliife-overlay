# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils autotools

DESCRIPTION="Command Line Tool for LibSass."
HOMEPAGE="http://libsass.org/"
SRC_URI="https://github.com/sass/sassc/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND="www-misc/libsass"
RDEPEND="www-misc/libsass"

src_prepare() {
	eautoreconf
}
