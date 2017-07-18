# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils cmake-utils linux-info

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://www.github.com/anbox/${PN}.git"
else
	KEYWORDS="~amd64"
fi

ANDROID_IMAGE_NAME="android_3_amd64.img"

SRC_URI="https://build.anbox.io/android-images/2017/07/13/${ANDROID_IMAGE_NAME}"

DESCRIPTION="Run Android on Linux via containers"
HOMEPAGE="http://anbox.io/
		https://github.com/anbox/anbox"
LICENSE="GPL-3"
SLOT="0"

CONFIG_CHECK="~ASHMEM ~ANDROID_BINDER_IPC"
ERROR_ASHMEM="\e[4m\e[1mASHMEM\e[21m needs to be enabled in the kernel in order for anbox to work\e[0m"
ERROR_ANDROID_BINDER_IPC="\e[4m\e[1mANDROID_BINDER_IPC\e[21m needs to be enabled in the kernel in order for anbox to work"

IUSE=""

DEPEND="sys-apps/dbus
	dev-libs/dbus-c++
	media-libs/glm
	dev-cpp/gtest
	dev-cpp/gmock
	dev-libs/boost
	sys-libs/libcap
	media-libs/mesa[gles1,gles2]
	dev-libs/glib:2
	media-libs/libsdl2
	dev-libs/protobuf
	app-emulation/lxc"
RDEPEND="${DEPEND}"

src_install() {
	cmake-utils_src_install

	# Insert udev rules
	insinto /lib/udev/rules.d/
	doins "${FILESDIR}"/99-anbox.rules

	# Insert desktop file
	domenu "${FILESDIR}"/anbox.desktop
	# And icon
	doicon --size 512 "${S}"/snap/gui/icon.png

	# add android image
	insinto /var/lib/anbox
	newins "${DISTDIR}"/"${ANDROID_IMAGE_NAME}" android.img
}

# vim: set shiftwidth=0:
