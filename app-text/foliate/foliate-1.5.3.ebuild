# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils gnome2-utils

DESCRIPTION="A simple and modern eBook viewer"
HOMEPAGE="https://johnfactotum.github.io/foliate/"
SRC_URI="https://github.com/johnfactotum/${PN}/archive/${PV}.tar.gz"

LICENSE="GNU-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/gettext dev-util/meson >=dev-libs/gjs-1.52 >=net-libs/webkit-gtk-2 dev-util/ninja"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile () {
	meson build --prefix=/usr
	ninja -C build
	DESTDIR=${S} ninja -C build install
}

src_install () {
	dobin ${S}/usr/bin/com.github.johnfactotum.Foliate
	for f in $(find ${S}/usr -iname '*.mo'); do
		domo $f
	done
	insinto /usr/share/
	doins -r ${S}/usr/share/com.github.johnfactotum.Foliate
	insinto /usr/share/applications
	doins /usr/share/applications/com.github.johnfactotum.Foliate.desktop
	insinto /usr/share/icons/hicolor/scalable/apps/
	doins ${S}/usr/share/icons/hicolor/scalable/apps/com.github.johnfactotum.Foliate.svg
	insinto /usr/share/icons/hicolor/symbolic/apps/
	doins ${S}/usr/share/icons/hicolor/symbolic/apps/com.github.johnfactotum.Foliate-symbolic.svg
	insinto /usr/share/metainfo
	doins ${S}/usr/share/metainfo/com.github.johnfactotum.Foliate.appdata.xml
	insinto /usr/share/glib-2.0/schemas
	doins ${S}/usr/share/glib-2.0/schemas/com.github.johnfactotum.Foliate.gschema.xml
}

pkg_postinst () {
	xdg_icon_cache_update
	xdg_desktop_database_update
	gnome2_schemas_update
}
