#!/system/bin/sh
#by plaz for skomorox as example(because which on onelon not usefull) and for self use
export all="n"
source utils.sh
source find.sh
# trap "" SIGINT
busybox 1>/dev/zero 2>/dev/zero || error "You will install busybox"
exec 2>error.log
echo "Starting script"
ls /root || error "You will have privilegies of root"


source backup.sh

export blackwords="asus google" # black words for plaz phone
while [ 1 == 1 ]
do 
	echo "~~~~~~~~~~~MENU~~~~~~~~~~~~~~"
	echo "For exit write 'exit'"
	echo "fad < found app and delete that"
	echo "back_do dir(/system/priv-app)"
	echo "back_extract dir"
	echo "back_list"
	echo "start < start just work(delete all google and init(asus/google) bullshit which i can see)" 
	#echo "I get $what"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	read what
	case "$what" in
	*exit*)
		echo "Exiting"
		exit 0;;
	*fad*)
		echo "start search"
		echo "Write list of dirs(separter is space):"
		read list
		search $list
		;;
	back_list)
		echo "Backup list"
		dolist
		;;
	back_extract*)
		echo "back use"
		echo "Write dir:"
		read dir
		doextract $dir
		;;
	back_do*)
		echo "back do"
		echo "Write dir:"
		read dir
		doback $dir
		;;
	start)
		echo "Starting"
		echo $blackwords
		search $blackwords
		;;
	*)
		echo "$what is undefined";;
	esac
	echo "###############################"
done
