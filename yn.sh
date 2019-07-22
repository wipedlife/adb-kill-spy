#!/system/bin/sh
yn(){
#	echo "$all = all"
	if [[ "$all" == "y" ]];then
		return 0
	fi;

	echo "$1?[y/n/a]: "
        read sure
        while [[ "$sure" != "y"* ]] && [[ "$sure" != "n"* ]] && [[ "$sure" != "a"* ]];
        do
		echo "$1?[y/n/a]: "
                read sure
        done;
        if [[ $sure == "y"* ]];then
                return 0
        elif [[ $sure == "n"* ]]
	then
                return 1
	else
		export all="y"
		return 0
        fi;
}
