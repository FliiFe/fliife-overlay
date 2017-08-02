# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils git-2 autotools

DESCRIPTION="A C/C++ implementation of a Sass compiler."
HOMEPAGE="http://libsass.org/"
EGIT_PROJECT='libsass'
EGIT_REPO_URI="https://github.com/sass/libsass.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND=">=sys-devel/gcc-4.5.4"
RDEPEND=""

src_prepare() {
	eautoreconf
}
