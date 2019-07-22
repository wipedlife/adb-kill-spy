#!/system/bin/sh
dirback="/adbkillgoogle-backups"
mount -o remount,rw /
if ! [ -d $dirback ];then 
	echo "You not have dir for backup, i will create that"
	mkdir $dirback || error "Cannot create $dirback"
fi

doback(){
	if [ $# \< 1 ];then
		error "$0 dir"
	fi;
	echo "Do tar"
	mkdir -p $dirback/$1
	tar cvf "$dirback/$1/back.tar" "$1"	
	echo "finish"
}

dolist(){
	ls -R $dirback
	
}

doextract(){
	
	l=`pwd`
	cd $dirback
	tar xvf "$dirback/$1/back.tar" "$1"
	cd $l
}
