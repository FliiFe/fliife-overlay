# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="All-in-one voice and text chat for gamers"
HOMEPAGE="https://discordapp.com/"

SRC_URI="https://dl-canary.discordapp.net/apps/linux/${PV}/${P}.tar.gz"
LICENSE="all-rights-reserved"
S="${WORKDIR}/DiscordCanary"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE="+desktop"
RESTRICT="mirror"

src_prepare() {
	cp discord.png discord-canary.png
	cp DiscordCanary discord-canary

	mv resources "resources-${PV}"
	ln -s "resources-${PV}" resources

	chmod +x DiscordCanary
	eapply_user
}

src_install() {
	insinto /usr/share/discord-canary
	for file in *; do
		test "$file" == "DiscordCanary" || doins -r $file;
	done

	exeinto /usr/share/discord-canary
	doexe "${S}"/DiscordCanary

	dosym /usr/share/discord-canary/DiscordCanary /usr/bin/discord-canary

	use desktop && domenu discord-canary.desktop
	use desktop && doicon discord-canary.png
}

# vim: set shiftwidth=0:
