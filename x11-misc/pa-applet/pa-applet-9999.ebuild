# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 autotools

DESCRIPTION="A systray app to control pulseaudio"
HOMEPAGE="https://github.com/mschwager/pa-applet"
EGIT_REPO_URI="https://github.com/mschwager/pa-applet.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/glib >=x11-libs/gtk+-3.0.0 x11-libs/libnotify media-sound/pulseaudio x11-libs/libX11"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eaclocal
	eautoconf
	eautoheader
	eautomake
}
