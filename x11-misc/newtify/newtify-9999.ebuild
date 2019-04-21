# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A modern notification daemon"
HOMEPAGE="https://github.com/FliiFe/notifyd"
EGIT_REPO_URI="https://github.com/FliiFe/newtifyd.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/nodejs[npm]"
RDEPEND="${DEPEND}"
RESTRICT="network-sandbox"
