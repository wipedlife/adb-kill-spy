#!/system/bin/sh
echo "Loading procs.sh"
find_proc(){
if !	need_args $0 1 "find_proc name_of_programm" $#
	then
		return 1
	fi;
	#procs=`ps | grep $1`
	#counter=0;#shitcode counter
	#for proc in $procs
	#do
	#done
	ps | grep $1
	echo "Which pid?: "
	read pid
	cd /proc/$pid || error "not correct pid"
	while [ 1 == 1 ]
	do
		echo "exit - exit from loop"
		echo "exe - See exe"
		echo "kill proc"
		echo "pkill proc(all where $1)"
		echo "maps - read maps(memory)"
		echo "mount - read mounts"
		echo "other - read other file"
		echo "~"
		read variant
		case "$variant" in
	
		exit)
			break;;	
		pkill)
			pkill $1;;
		kill)
			kill $pid;;
		maps)
			cat maps;;
		mount)
			cat mounts;;
		exe)
			ls -l exe;;
		other)
			echo "file: "
			read file
			cat $file;;
		*)
			echo "undefined $variant";;
		esac		
	done
	
}
