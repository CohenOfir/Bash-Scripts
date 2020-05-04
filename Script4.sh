#! /bin/bash
# Name: Ofir Cohen
# ID:   205989346
name=$1
file=$2
balance=0
changed=0
found=0
#how many words in current user name
nameWordsCount=$(echo $name | wc -w)

while IFS= read -r line
do
nameString=( $name )
lineString=( $line )
#check if user name exactly match - private,middle,last names must match
for (( i = 0; i < $nameWordsCount; i++ ))
do
if [[  ${nameString[i]} == ${lineString[i]} ]];then
	let "found=found+1"
	fi
done
#user name ends
  if [[ $found == $nameWordsCount ]]; then 
#check if numbers field reached  
    if [[  ${lineString[$found]} =~ [0-9] ]];then
	    echo "$line"
		balance=$((balance + ${lineString[$found]}))
		changed=1;
	fi
    
  fi
  found=0
done < "$file"
#if balance changed- print 
if [[ $changed == 1 ]]; then 
 echo "Total balance:" $balance
 fi

