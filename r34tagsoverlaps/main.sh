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

T1=($(GetTagsHit $1))
T2=($(GetTagsHit $2))
Both=$(GetBothTagsHit $T1 $T2)
P1=$(Proportion ${T1[1]} $Both)
P2=$(Proportion ${T2[1]} $Both)


echo "there is ${T1[1]} hits of $T1 and ${T2[1]} hits of $T2"
echo "Mixed they have $Both hits"
echo "$2 is present in $P1% of $1"
echo "$1 is present in $P2% of $2"
}


#total = $1 part = $2
Proportion(){
total=$1
part=$2
local r=$(bc <<< "scale=4; $part/$total*100")
if [[ $r =~ ^\. ]]
then
	r="0$r"
fi

if [[ $r =~ 0$ ]]
then
	r=$(sed s'/0\+$//' <<< $r)
fi
echo $r
}


ListTags(){
[ -z $1 ] && echo "error no input given" >&2 && exit

curl -s https://rule34.xxx/autocomplete.php?q=${1} | grep -Po '[a-zA-Z]+ \([0-9]+' | tr -d '('
}

GetTagsHit(){

[ -z $1 ] && echo "error no input given" >&2 && exit

hits=($(curl -s https://rule34.xxx/autocomplete.php?q=${1} | grep -Po '[_a-zA-Z]+ \([0-9]+' | tr -d '('))
echo ${hits[@]}
}

GetBothTagsHit(){
[ -z $1 ] && echo "missing first tag" >&2 && exit
[ -z $2 ] && echo "missing second tag" >&2 && exit
result=$(curl -s "https://rule34.xxx/index.php?page=post&s=list&tags=${1}+${2}" | grep -Eo '[0-9]+" alt="last page' | grep -Eo "^[0-9]+")
[ -z $result ] && GetBothTagsHitSafe $1 $2 || echo $result
}

#if there is only one page
GetBothTagsHitSafe(){
result=$(curl -s "https://rule34.xxx/index.php?page=post&s=list&tags=${1}+${2}" | grep -o 'class="preview' | wc -l)
[ -z $result ] && echo "Something is wrong abort" >&2 && exit
echo $result
}
### RUN IT

case $1 in

	*)
	GetDifference $1 $2
	;;

esac
