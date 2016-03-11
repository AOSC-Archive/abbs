#!/bin/bash
# abbs-source.sh: functions for getting the source
# 
#   Partly adopted from makepkg functions:
#   Copyright (c) 2006-2015 Pacman Development Team <pacman-dev@archlinux.org>
#   Copyright (c) 2002-2006 by Judd Vinet <jvinet@zeroflux.org>
#   Copyright (c) 2005 by Aurelien Foret <orelien@chez.com>
#   Copyright (c) 2006 by Miklos Vajna <vmiklos@frugalware.org>
#   Copyright (c) 2005 by Christian Hamar <krics@linuxforum.hu>
#   Copyright (c) 2006 by Alex Smith <alex@alex-smith.me.uk>
#   Copyright (c) 2006 by Andras Voroskoi <voroskoi@frugalware.org>

## Gets something for the URI given.
##@see libmakepkg/source.sh:download_sources
abbs_get(){
	[ "$1" ] || return
	
}

# The full getter.
abbs_get_full(){
	local filename realuri
	# get filename..
	
	# do the work..
	abbs_get "$realuri" || abbs_get "${MIRROR[$realuri]}"
	# sig
	local shouldextract
	# sum
	
}

##@see libmakepkg/util/source.sh:get_protocol
abbs_get_proto(){
	if [[ $1 = *://* ]]; then
		# strip leading filename
		local proto="${1#*::}"
		printf "%s\n" "${proto%%://*}"
	elif [[ $1 = *lp:* ]]; then
		local proto="${1#*::}"
		printf "%s\n" "${proto%%lp:*}"
	else
		printf "%s\n" local
	fi
}

##@see libmakepkg/util/source.sh:get_filename
abbs_get_filename(){
	local netfile=$1

	# if a filename is specified, use it
	if [[ $netfile = *::* ]]; then
		printf "%s\n" ${netfile%%::*}
		return
	fi

	local proto=$(abbs_get_proto "$netfile")

	case $proto in
		bzr*|git*|hg*|svn*|cvs*)
			filename=${netfile%%#*}
			filename=${filename%/}
			filename=${filename##*/}
			if [[ $proto = bzr* ]]; then
				filename=${filename#*lp:}
			fi
			if [[ $proto = git* ]]; then
				filename=${filename%%.git*}
			fi
			;;
		*)
			# if it is just an URL, we only keep the last component
			filename="${netfile##*/}"
			;;
	esac
	printf "%s\n" "${filename}"
}

##@see 