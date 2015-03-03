export ABSET=/etc/autobuild
export AB=`cat /etc/autobuild/prefix`
export ABBSSET=/etc/autobuild
export ABBS=`cat /etc/abbs/prefix`
export ABBLPREFIX=$ABBS/lib

# Load the base lib
. $ABBS/lib/base.sh
abloadlib abbs

export PATH=$ABBS/libexec:$PATH
