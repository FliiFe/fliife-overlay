# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="An adaptive Gtk+ theme based on Material Design Guidelines."
HOMEPAGE="https://github.com/adapta-project/adapta-gtk-theme"
SRC_URI="https://github.com/adapta-project/adapta-gtk-theme/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cinnamon flashback unity xfce mate openbox gtk_legacy gtk_next parallel"

DEPEND="media-gfx/inkscape
	dev-libs/libsass
	dev-lang/sassc
	dev-libs/libxml2
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	parallel? ( sys-process/parallel )"
RDEPEND="${DEPEND}"

src_configure() {
	mkdir -p "${S}/dest"
	./autogen.sh \
		$(use_enable cinnamon) \
		$(use_enable flashback) \
		$(use_enable unity) \
		$(use_enable xfce) \
		$(use_enable mate) \
		$(use_enable openbox) \
		$(use_enable gtk_legacy) \
		$(use_enable gtk_next) \
		$(use_enable parallel) \
		--disable-gnome \
		--prefix="${S}/dest"
}

src_install() {
	make install
	cd "${S}/dest/share/themes/"

	insinto /usr/share/themes
	doins -r Adapta
	doins -r Adapta-Eta
	doins -r Adapta-Nokto
	doins -r Adapta-Nokto-Eta
}
