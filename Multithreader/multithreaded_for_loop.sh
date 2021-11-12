#!/bin/bash

### Input Guards

# $1 => the array to split
# $2 => the numbers of threads
# $3 => the name of the function to multitrhead
# $4 => true or false if we continue despite each program not being finished (default false we wait until everything finished)
# i hate to exit; 
# but i have to because i need a way to find if the program if being source or if it's a subshell
# need to think about it tbh
if [ -z "$1" ]
then
	echo "Error arg 1" >&2
	echo "Need the string to be split in this format: word[whitepace]word or if you preferer \"aaa bbb ccc\"" >&2
	exit 1
fi

if [ -z $2 ] || [[ ! $2 =~ [0-9]+ ]]
then
	echo "Error arg 2" >&2
	echo "Precise with only numbers how many subprocess you want to be processed, you can be crazy :⁾)" >&2
	exit 2
fi

if [ -z $3 ] || [ -z "$(type "$3")" ] 
then
	echo "Error arg 3" >&2
	echo "Can't find the function "$3"" >&2
	exit 3
fi



# if it's ignored it's okay, if it's badly specified it stops 
if [ -z $4 ]
then
	:
elif [ ! "$4" = false ] && [ ! "$4" = true ]
then
	echo "Error arg 4 it is true or false" >&2
	exit 4
fi



#

### Main Function

# $1 => array to pass on the function
# $2 => name of the function
enqueue_thread(){
	queue=($1)
	for item in ${queue[@]}
	do
	eval "$2" "$item"
	done
}

main_array=($1)
declare -i max_iterator=$((2 -1)) # because the array start at 0
declare -a splitter
declare -i splitter_iterator=0
for item in "${main_array[@]}"
do
	splitter[$splitter_iterator]=""${splitter[$splitter_iterator]}" "${item}""
	((splitter_iterator+=1))
	[ $splitter_iterator -gt $max_iterator ] && splitter_iterator=0
done

declare -a PIDlist
for splitted_array in "${splitter[@]}"
do
	enqueue_thread "$splitted_array" "$3" &
	PIDlist+=($!)
done


if   [ -z "$4" ] || [ "$4" = false ]
then
	for pid in ${PIDlist[@]}
	do
		wait $pid
	done
fi
