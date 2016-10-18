#! /bin/bash
. $ABBS/env/base.sh

rm -f /var/abbs/test/playground/etb/foobuild/*

test='abbs-process etb/foobuild'
abbs-process etb/foobuild &>>$TESTLOG
testchk
test='(all? exist? /var/abbs/test/playground/etb/foobuild/{a,b})'
[ -e /var/abbs/test/playground/etb/foobuild/a ] &&
[ -e /var/abbs/test/playground/etb/foobuild/b ]
testchk
testend
