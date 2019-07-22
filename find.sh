#!/system/bin/sh
source yn.sh
search(){

	mount -o remount,rw /system
	if [ $# \< 1 ];then
		echo "$0 nameprog(google) ..."
	fi;
	#{1..$#} not working also as (( ))
	path=$PATH:/system/priv-app:/system/app:/etc:/ # /etc / for init scripts
	for prog in $@
	do
		#FS=":"
		progup=`echo $prog | tr [a-z] [A-Z]`
		for dir in ${path//:/ }
		do
			echo "searching $prog in $dir"
			for indir in `ls $dir`
			do
				#echo $indir
				dirupper=`echo $indir | tr [a-z] [A-Z]`
				if [[ *"$dirupper"* == *"$progup"* ]];then
					if yn "I will delete $prog from $indir? I found that!";
					then
						if yn "delete $dir/$indir?";then
							rm -r $dir/$indir
						else
							echo "NA NET I SPROSY NET"
						fi
					else
						echo "I not found $progup in $dirupper"
					fi;
				fi;
			done;
		done;		
	done      
}





echo "FIND.sh included"

