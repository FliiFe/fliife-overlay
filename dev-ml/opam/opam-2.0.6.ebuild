# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="A source-based package manager for OCaml"
HOMEPAGE="http://opam.ocaml.org/"
LICENSE="LGPL-3-with-linking-exception"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~x86"

SRC_URI="https://github.com/ocaml/opam/releases/download/${PV}/${PN}-full-${PV}.tar.gz -> ${P}.tar.gz"

RDEPEND="dev-lang/ocaml"
	# dev-ml/opam-file-format:=

DEPEND="${RDEPEND}
	sys-apps/bubblewrap
"

S="${WORKDIR}/${PN}-full-${PV}"

src_compile() {
	emake lib-ext -j1
	emake -j1
	cd doc
	emake man -j1
}

src_install() {
	default
	# emake DESTDIR="${D}" OPAMINSTALLER_FLAGS="--prefix=\"${ED}/usr\" --libdir=\"${D}/$(ocamlc -where)\"" libinstall -j1
}
