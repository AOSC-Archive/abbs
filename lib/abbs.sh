#!/bin/bash
aosc_lib abbs
abbscheckspec(){ [ -d $ABBS/repo/$1 ] || abdie "No such package specification $1."; }
abbstmpf(){ mktemp --suffix=.abbs; }
abbsallocenv(){ TEMPDIR="$ABBSENVPOS" mktemp -d; }
