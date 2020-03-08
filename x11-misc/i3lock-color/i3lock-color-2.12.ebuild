# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils autotools toolchain-funcs git-r3

DESCRIPTION="Simple screen locker"
HOMEPAGE="https://github.com/PandorasFox/i3lock-color"
EGIT_REPO_URI="https://github.com/PandorasFox/i3lock-color.git"
EGIT_COMMIT="refs/tags/${PV}.c"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

MY_PN=i3lock

RDEPEND="!x11-misc/i3lock
	sys-libs/pam
	dev-libs/libev
	>=x11-libs/libxkbcommon-0.5.0[X]
	x11-libs/libxcb[xkb]
	x11-libs/xcb-util
	x11-libs/cairo"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
DOCS=( CHANGELOG README.md )

pkg_setup() {
	tc-export CC
}

src_prepare() {
	eautoreconf || die
	./configure || die

	epatch_user
}

src_install() {
	default
	doman ${MY_PN}.1
	# mv -v "${D}"/etc/pam.d/${MY_PN} "${D}"/etc/pam.d/${PN} || die
}
