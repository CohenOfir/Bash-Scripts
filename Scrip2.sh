#! /bin/bash
# Name: Ofir Cohen
# ID:   205989346
lineCounter=1
#writing all txt files names into assist file
ls $1 -l | grep .txt | awk '{ print $9 }' > assist.txt
while IFS= read -r line
do
  if [[ $line != "assist.txt" ]]; then
  echo -n "$lineCounter "
  echo -n $line
  echo " is a file"
  let "lineCounter=lineCounter+1"
  fi
done < "assist.txt"

#writing all directory names into assist file
ls -l $1 | grep '^d' | awk '{print $9}' > assist.txt
while IFS= read -r line
do
echo -n "$lineCounter "
  echo -n $line
  echo " is a directory"
  let "lineCounter=lineCounter+1"
  
done < "assist.txt"
#remove Assist file
rm assist.txt
