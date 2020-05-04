#! /bin/bash
# Name: Ofir Cohen
# ID:   205989346
file=$1
keyWord=$2
lineCounter=1
grep "" "$file" > assist.txt
while IFS= read -r line
do
for word in $line;
do
#if word is in line 
if [[ $word == $keyWord ]]; then 
echo -n "$lineCounter "
  echo "$line" | wc -w
  fi
done
  let "lineCounter=lineCounter+1"

done < "assist.txt"
#remove assist file
rm assist.txt

