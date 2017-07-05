# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils linux-mod

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://www.github.com/anbox/anbox.git"
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Required kernel modules for anbox"
HOMEPAGE="http://anbox.io/
https://github.com/anbox/anbox"
LICENSE="GPL-3"
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${P}/kernel"

BUILD_TARGETS="clean all"
MODULE_NAMES="ashmem_linux(misc:${S}/ashmem) binder_linux(misc:${S}/binder)"

pkg_postinst() {
	linux-mod_pkg_postinst
	elog "If you are using sys-apps/openrc, please add \"ashmem_linux\", \"binder_linux\""
	elog "to:"
	elog "  /etc/conf.d/modules"
}

# vim: set shiftwidth=0:
