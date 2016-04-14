: ${ABSET=/etc/autobuild} ${AB=$(<"$ABSET/prefix")}
: ${ABBSSET=/etc/abbs} ${ABBS=$(<"$ABBSSET/prefix")} ${ABBLPREFIX="$AB/lib"}
PATH="$ABBS/libexec:$PATH"
export ABSET AB ABBSSET ABBS ABBLPREFIX PATH ABSET

((ABBSENV_VARONLY)) && return
# Load the base lib
. "$AB"/lib/base.sh
# HACK!
. "$ABBS"/lib/abbs.sh && ABLIBS+='abbs|'

recsr "$ABBS"/etc/abbs/*
. "$AB"/etc/autobuild/ab3_defcfg.sh

export $(cat $ABBS/params/*)
