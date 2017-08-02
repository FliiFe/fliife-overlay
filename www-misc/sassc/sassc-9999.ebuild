# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils git-2 autotools

DESCRIPTION="Command Line Tool for LibSass."
HOMEPAGE="http://libsass.org/"
EGIT_PROJECT='sassc'
EGIT_REPO_URI="https://github.com/sass/sassc.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="www-misc/libsass"
RDEPEND="${DEPEND}"
DEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
