# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils

DESCRIPTION="Application launcher for Linux"
HOMEPAGE="https://ulauncher.io"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
	EGIT_REPO_URI="https://github.com/Ulauncher/${PN^}.git"
else
	# SRC_URI="https://github.com/Ulauncher/${PN^}/archive/${PV}.${PR}.tar.gz -> ulauncher_${PV}.${PR}.tar.gz"
	SRC_URI="https://github.com/Ulauncher/${PN^}/releases/download/${PV}.${PR}/ulauncher_${PV}.${PR}.tar.gz -> ulauncher_${PV}.${PR}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN^}-${PV}.${PR}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

PYTHON_REQ_USE="sqlite"

DEPEND="
	dev-python/python-distutils-extra[${PYTHON_USEDEP}]
	sys-apps/yarn"

RDEPEND="${DEPEND}
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/pyinotify[${PYTHON_USEDEP}]
	dev-python/python-levenshtein[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev-libs/gobject-introspection[${PYTHON_USEDEP}]
	dev-libs/libappindicator:3
	dev-libs/keybinder:3
	net-libs/webkit-gtk:4/37
"

BDEPEND="${PYTHON_DEPS}"

src_prepare(){
	find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
	pushd data/preferences
	yarn install
	yarn build
	rm -rf node_modules
	popd
	distutils-r1_src_prepare
}

src_install(){
	domenu build/share/applications/${PN}.desktop
	distutils-r1_src_install
}
