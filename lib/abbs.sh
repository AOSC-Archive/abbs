#!/bin/bash
aosc_lib abbs
abbscheckspec(){ [ -d $ABBS/repo/$1 ] || abdie "No such package specification $1."; }
abbstmpf(){ mktemp --suffix=.abbs; }
abbsallocenv(){ TMPDIR="$ABBSENVPOS" mktemp -d; }

# A simple stringset impl using dicts
abbs_set(){ declare -gA "$1"; }
abbs_set_add(){ declare -n __set="$1"; local __idx; for __idx in "${@:1}"; do __set["$__idx"]=1; done; }
abbs_set_del(){ local __a=("${@:1}"); __a=("${a[@]/#/$1\[}"); unset "${a[@]/%/\]}"; }
abbs_set_arr(){ declare -n __set="$1" __arr="$2"; __arr=("${!__set[@]}"); }
