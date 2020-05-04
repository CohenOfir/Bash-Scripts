#! /bin/bash
# Name: Ofir Cohen
# ID:   205989346
function enterDir () {
cd $1
ls -l > assist2.txt
while IFS= read -r line
	do
	a=( $line )
	#8th col - file name - check if equals to desired.
	if [[ ${a[8]} == $filename ]]; then
		printFile $filename
	fi
	done < "assist2.txt"
	rm assist2.txt
	cd ..
}

#Print Function
function printFile () {
awk 1 $1
}

filename=$2
path=$1

#2nd lvl search 
cd "$path"
ls -l > assist1.txt
while IFS= read -r line
	do
	a=( $line )
	#if is directroy
	 if [[  ${a[0]} =~ [d] ]];then
		enterDir ${a[8]}
	else
		if [[ ${a[8]} == $filename ]]; then
		printFile $filename
		fi
	fi
done < "assist1.txt"
rm assist1.txt



