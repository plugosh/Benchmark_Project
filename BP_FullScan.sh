#!/bin/bash

> BPD_FullList.txt

fail=0
success=0

dpkg -l | cut -d ' ' -f3-3 >> ./BPD_FullList.txt

Linecounter=`wc -l < ./BPD_FullList.txt`

for (( i = 7; i <$Linecounter; i++ )); do

	sudo apt-get install `sed -n ${i}p ./BPD_FullList.txt`

done