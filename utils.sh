#!/system/bin/sh
error(){
	if [ $# \< 1 ];then
		echo "undefined error";
	else
		echo $1
	fi

	if [ $# \< 2 ]; then
		exit 1
	else
		exit $2
	fi;
}

need_args(){
	if [ $4 \< $2 ];then
		echo "$1 $3"
		return 1;
	fi;
	return 0
}
