#!/bin/bash

> BPD_FullList.txt

fail=0
success=0

dpkg -l | cut -d ' ' -f3-3 >> ./BPD_FullList.txt

Linecounter=`wc -l < ./BPD_FullList.txt`

possible=0
impossible=0

for (( i = 7; i <$Linecounter; i++ )); do

	#`sed -n ${i}p ./BPD_FullList.txt`

	COutput=$(apt-cache policy `sed -n ${i}p ./BPD_FullList.txt`)
	#echo "$COutput"
#num=$(($num1 + $num2))
	if [[ -z "$COutput" ]]; then
		impossible=$(($impossible+1))
	else
		
		possible=$(($possible+1))
	fi
	#sudo apt-get install `sed -n ${i}p ./BPD_FullList.txt`

	#echo "$i"

done

echo "$possible"
echo "$impossible"