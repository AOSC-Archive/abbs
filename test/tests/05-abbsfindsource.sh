#! /bin/bash
. $ABBS/env/base.sh

testcmd abbsfindsource abbs-unittest-foo-bar
testcmd abbsfindsource abbs-unittest-foo-baz-a
testcmd abbsfindsource abbs-unittest

testend
