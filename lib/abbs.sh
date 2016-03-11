#!/bin/bash
shopt -s expand_aliases
aosc_lib abbs
abbscheckspec(){ [ -d $ABBS/repo/$1 ] || abdie "No such package specification $1."; }
abbstmpf(){ mktemp --suffix=.abbs; }
abbsallocenv(){ TMPDIR="$ABBSENVPOS" mktemp -d; }

# HACK: awful override function
_abloadlib=$(declare -f abloadlib)
eval "${_abloadlib/abloadlib/_abloadlib}"
readonly -f _abloadlib
unset _abloadlib
abloadlib(){
	ABBLPREFIX=$ABBS/lib _abloadlib "$@" ||
	ABBSPREFIX=$AB/lib   _abloadlib "$@"
}
