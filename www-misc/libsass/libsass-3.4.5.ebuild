# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils autotools

DESCRIPTION="A C/C++ implementation of a Sass compiler."
HOMEPAGE="http://libsass.org/"
SRC_URI="https://github.com/sass/libsass/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND=">=sys-devel/gcc-4.5.4"
RDEPEND=""

src_prepare() {
	eautoreconf
}
