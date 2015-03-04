export ABSET=/etc/autobuild
export AB=`cat /etc/autobuild/prefix`
export ABBSSET=/etc/abbs
export ABBS=`cat /etc/abbs/prefix`
export ABBLPREFIX=$ABBS/lib

# Load the base lib
. $ABBS/lib/base.sh
abloadlib abbs

export PATH=$ABBS/libexec:$PATH

recsr $ABBS/etc/abbs/*

for i in `cat $ABBS/params/*`
do
        export $i
done

