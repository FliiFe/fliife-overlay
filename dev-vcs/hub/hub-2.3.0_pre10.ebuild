# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit bash-completion-r1 readme.gentoo-r1

DESCRIPTION="Command-line wrapper for git that makes you better at GitHub"
HOMEPAGE="https://github.com/github/hub"
SRC_URI="${HOMEPAGE}/archive/v${PV//_/-}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND=">=dev-lang/go-1.5.1:= dev-lang/ruby"
RDEPEND=">=dev-vcs/git-1.7.3"

S="${WORKDIR}/${P//_/-}"

DOC_CONTENTS="You may want to add 'alias git=hub' to your .{csh,bash}rc"

src_prepare() {
	./script/bootstrap || die
	make man-pages
	default
}

src_compile() {
	./script/build || die
}

#src_test() {
#	./script/test || die
#}

src_install() {
	readme.gentoo_create_doc

	dobin bin/hub

	for manpage in share/man/man1/*.1; do
		doman "${manpage}";
	done
	dodoc README.md

	newbashcomp "etc/${PN}.bash_completion.sh" "${PN}"

	insinto /usr/share/zsh/site-functions
	newins etc/hub.zsh_completion _"${PN}"

	insinto /usr/share/fish/completions
	newins etc/hub.fish_completion "${PN}.fish"
}

pkg_postinst() {
	readme.gentoo_print_elog
}
