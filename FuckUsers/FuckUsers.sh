#!/bin/bash

#Check if you didn't pass a user to NOT be kicked
[[ -z $1 ]] && echo -e "usage:\n./FuckUsers <user";

#looking for others users and start kicking them

users=(`who | cut -d ' ' -f1`)
for i in "${users[@]}"
do
	echo $i $1
	[[ "$i" !=  "$1" ]] && pkill -u $i;
done
