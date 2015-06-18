export ABSET=/etc/autobuild
export AB=`cat $ABSET/prefix`
export ABBSSET=/etc/abbs
export ABBS=`cat $ABBSSET/prefix`
export ABBLPREFIX="$ABBS/lib"
export PATH="$ABBS/libexec:$PATH"

((ABBSENV_VARONLY)) && return
# Load the base lib
. $ABBS/lib/base.sh
abloadlib abbs

recsr $ABBS/etc/abbs/*

export $(cat $ABBS/params/*)
