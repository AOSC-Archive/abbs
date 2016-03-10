: ${ABSET=/etc/autobuild} ${AB=$(<"$ABSET/prefix")}
: ${ABBSSET=/etc/abbs} ${ABBS=$(<"$ABBSSET/prefix")} ${ABBLPREFIX="$AB/lib"}
PATH="$ABBS/libexec:$PATH"
export ABSET AB ABBSSET ABBS ABBLPREFIX PATH ABSET

((ABBSENV_VARONLY)) && return
# Load the base lib
. "$AB"/lib/base.sh
# HACK!
. "$ABBS"/lib/abbs.sh && ABLIBS+='abbs|'
abrequire set

recsr $ABBS/etc/abbs/*

export $(cat $ABBS/params/*)
