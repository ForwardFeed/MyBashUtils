#!/bin/bash
    
[ -z $1 ] && echo "what number in /dev/input/eventX do you want to read?" && exit

f5(){

while :
	do
		cat "/dev/input/event"$1"" | head -c 24 | od -bAn -j 20 | grep -Po "^ \K[0-9]+" 
	done
}

f5 $1
