#! /bin/bash
. $ABBS/env/base.sh

#TEST : abbscheckspec
test='abbscheckspec foo/bar'
$test
testchk
test='abbscheckspec error/how_can_i_exist'
$test
testchk 1

#TEST : abbstmpf
test='rm -v $(abbstmpf)'
rm -v `abbstmpf`
testchk

#TEST : abbsallocenv
test='[ -d $(ABBSENVPOS=/tmp abbsallocenv foo-bar) ]'
export ABBSENVPOS=/tmp
ENV="`abbsallocenv foo-bar`"
[ -d $ENV ]
testchk
echo TESTING INGO : $ENV
rm -rf $ENV
unset ABBSENVPOS
testend
