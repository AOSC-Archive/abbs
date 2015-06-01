#!/bin/bash
aosc_lib abbs
abbscheckspec(){ [ -d $ABBS/repo/$1 ] || abdie "No such package specification $1."; }
abbstmpf(){
	while true
	do
		fn=/tmp/abbs-$RANDOM
		if [ ! -e $fn ]
		then
			touch $fn
			echo $fn
			return 0
		fi
	done
}
abbsallocenv(){
	while true
	do
		fn=$ABBSENVPOS/$1-$(date -u +%s)-$RANDOM
		if [ ! -e $fn ]
		then
			mkdir $fn
			echo $fn
			return 0
		fi
	done
}
