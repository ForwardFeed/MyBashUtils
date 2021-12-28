#!/bin/bash

### HELP FUNCTION

help(){
	cat <<EOF
how to use the script
EOF
}


### FUNCTIONS

IfRestart(){
	ip link set ensp2s0 down
	ip link set ensp2s0 up
}

MainDaemon(){
	while :
	do
		Checking
		IfRestart
		sleep 10
	done
}

Checking(){
	check=6
	while [ $check -eq 6 ]
	do
		check=$(ping -c 1 -w 1 192.168.1.1 | wc -l)
	done

}

### RUN IT

case $1 in

	*)
	MainDaemon
	;;

esac
