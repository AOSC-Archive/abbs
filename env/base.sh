: ${ABSET=/etc/autobuild} ${AB=$(<"$ABSET/prefix")}
: ${ABBSSET=/etc/abbs} ${ABBS=$(<"$ABBSSET/prefix")} ${ABBLPREFIX="$ABBS/lib"}
PATH="$ABBS/libexec:$PATH"
export ABSET AB ABBSSET ABBS ABBLPREFIX PATH ABSET

((ABBSENV_VARONLY)) && return
# Load the base lib
. $ABBS/lib/base.sh
abloadlib abbs

recsr $ABBS/etc/abbs/*

export $(cat $ABBS/params/*)
