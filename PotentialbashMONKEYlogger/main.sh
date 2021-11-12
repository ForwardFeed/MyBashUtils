#!/bin/bash

### HELP FUNCTION

help(){
	cat <<EOF
how to use the script
EOF
}


### FUNCTIONS
getlocale(){



}

readkey(){
[ -z $1 ] && echo "no keyboard found" && exit 
while :
do
	event=$(dd if=/dev/input/${1} status=none bs=24 count=1 2>/dev/null | xxd -p)
	key_hex=$(echo ${event:40:42} | head -c 2)
	echo $((16#$key_hex))
done
}

getKeyboard(){
	echo $(grep -E  'Handlers|EV=' /proc/bus/input/devices | \
	grep -B1 'EV=120013' | \
	grep -Eo 'event[0-9]+')

}
### RUN IT
case $1 in

	*)
	#help
	readkey $(getKeyboard)
	;;

esac
