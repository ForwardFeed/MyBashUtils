#!/bin/bash

### HELP FUNCTION

help(){
	cat <<EOF
how to use the script
EOF
}


### FUNCTIONS

GetDifference(){
[ -z $1 ] && echo "missing first tag" >&2 && exit
[ -z $2 ] && echo "missing second tag" >&2 && exit

T1=$(GetTagsHit $1) 
T2=$(GetTagsHit $2)
Both=$(GetBothTagsHit $1 $2)
P1=$(Proportion $T1 $Both)
P2=$(Proportion $T2 $Both)

echo "there this $T1 hits of $1 and $T2 hits of $2"
echo "Mixed they have $Both"
echo "$2 is present in $P1% of $1"
echo "$1 is present in $P2% of $2"
}


#total = $1 part = $2
Proportion(){
total=$1
part=$2
bc <<< "scale=2; $part/$total*100"
}


ListTags(){
[ -z $1 ] && echo "error no input given" >&2 && exit

curl -s https://rule34.xxx/autocomplete.php?q=${1} | grep -Po '[a-zA-Z]+ \([0-9]+' | tr -d '('
}

GetTagsHit(){

[ -z $1 ] && echo "error no input given" >&2 && exit

hits=($(curl -s https://rule34.xxx/autocomplete.php?q=${1} | grep -Po '[a-zA-Z]+ \([0-9]+' | tr -d '('))
echo ${hits[1]}
}

GetBothTagsHit(){
[ -z $1 ] && echo "missing first tag" >&2 && exit
[ -z $2 ] && echo "missing second tag" >&2 && exit
curl -s "https://rule34.xxx/index.php?page=post&s=list&tags=${1}+${2}" | grep -Eo '[0-9]+" alt="last page' | grep -Eo "^[0-9]+"
}

### RUN IT

case $1 in

	*)
	GetDifference $1 $2
	;;

esac
