#! /bin/bash
. $ABBS/env/base.sh

testprog=bool
for testargs in yes Y true T 1
do
	bool "$testargs"
	testchk
done
for testargs in no N n false 0
do
	bool "$testargs"
	testchk 1
done
for testargs in inva lid meow
do
	bool "$testargs"
	testchk 2
done

test=ablog-io
pushd /tmp >/dev/null
rm -f ablog
ABDUMB=0 &&
echo "Hello ab" | ablog &&
grep -q "Hello ab" ablog
testchk
popd >/dev/null

test=abcommaprint
[ "$(AB_COMMA=_MIKOTO_ abcommaprint MISAKA RAILGUN STALLMAN)" == MISAKA_MIKOTO_RAILGUN_MIKOTO_STALLMAN ]
testchk
testend
