# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Tool to convert Android sparse images to raw images"
HOMEPAGE="https://github.com/anestisb/android-simg2img"
SRC_URI="https://github.com/anestisb/android-simg2img/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodoc README.md
	dobin append2simg img2simg simg2img simg2simg simg_dump.py
}
