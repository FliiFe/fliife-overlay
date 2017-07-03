# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

URELEASE="zesty"
inherit cmake-utils

CUSTOM_PV="${PV%%[a-z]_p*}"	# For package-3.6.0a_p0_p02
CUSTOM_PV="${CUSTOM_PV%%[a-z]*}"		# For package-3.6.0a
CUSTOM_PV="${CUSTOM_PV%%_p*}"			# For package-3.6.0_p0_p02
CUSTOM_PV="${CUSTOM_PV%%_*}"			# For package-3.6.0_p_p02

MY_P="${PN}_${CUSTOM_PV}"

UURL="mirror://ubuntu/pool/main/p/${PN}"

DESCRIPTION="C++11 library for handling processes"
HOMEPAGE="http://launchpad.net/process-cpp"
SRC_URI="${UURL}/${MY_P}.orig.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-libs/boost:=
	dev-libs/properties-cpp"

S="${WORKDIR}/${PN}-${CUSTOM_PV}${UVER_PREFIX}"
