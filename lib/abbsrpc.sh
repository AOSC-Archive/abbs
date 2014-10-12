abbsrcp(){
	PROTO=`echo $1 | cut -d : -f 1`
	ADDR="`echo $1 | cut -d : -f 2-`"
	shift 1
	abbsrcp_$PROTO $ADDR $*
}
abbsrx(){
	PROTO=`echo $1 | cut -d : -f 1`
	ADDR="`echo $1 | cut -d : -f 2-`"
	shift 1
	abbsrx_$PROTO $ADDR $*
}
abbsrcp_local(){
}
