# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Windscribe CLI"
HOMEPAGE="https://windscribe.com/"
SRC_URI="https://assets.staticnetcontent.com/desktop/linux/windscribe-cli-1.4-52.x86_64.rpm"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	rpm_src_unpack ${A}
	mkdir -p "${S}" # Without this src_prepare fails
}

src_install() {
	cp -pPR "${WORKDIR}"/{etc,usr} "${D}"/ || die "Installation failed"

	insinto / && doins -r / || die
}
