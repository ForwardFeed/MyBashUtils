#!/bin/bash

### MAIN VARIABLES

#ROUTER_ADDR
#The ip address of your local router
ROUTER_ADDR=

#IF_NAME
#Ubuntu 20.04 was ensp2s0
#Ubuntu 22.04 was enp2s0
IF_NAME=

### HELP FUNCTION

help(){
	cat <<EOF
This script is here to check if the interfaces are somewhat stuck
fill in the MAIN VARIABLES in the script to make it work
EOF
}

StartupCheck(){
if [ -z $ROUTER_ADDR ] || [ -z $IF_NAME ]
then
	echo "Some variables aren't set"
	echo "Please set the ROUTER_ADDR and IF_NAME inside the script"
	exit 1
fi
}
### FUNCTIONS

#Interface Restart
IfRestart(){
	ip link set "$IF_NAME" down
	ip link set "$IF_NAME"  up
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
		check=$(ping -c 1 -w 1 $ROUTER_ADDR | wc -l)
	done

}

### RUN IT

case $1 in
	
	"f")
	help
	;;
	*)
	StartupCheck
	MainDaemon
	;;

esac
