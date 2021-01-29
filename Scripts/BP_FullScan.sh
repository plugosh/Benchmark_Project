#!/bin/bash

#Clearing BPD_FullList file
> BPD_FullList.txt

fail=0
success=0

#Checking for all installed softwares
dpkg -l | cut -d ' ' -f3-3 >> ./BPD_FullList.txt

#Count lines (number of programs)
Linecounter=`wc -l < ./BPD_FullList.txt`

#Total ammount of programs found by dpkg
LCount=$(($Linecounter-6))

TUpd=0
n=0


#Loop that is installing all programs
	echo -e "\e[93m\e[1mUpdating in progress."
for (( i = 7; i <=Linecounter; i++ )); do

	echo -e "____________________________________________________________________"

	sudo apt-get install -y `sed -n ${i}p ./BPD_FullList.txt` 	#Installing
	
	progress=$(( $i * 100 / $LCount ))
	echo -ne "$progress % of your $LCount programs have been checked\r"

done

echo -e "\e[92mUpdating finished successfully.\e[0m"




	
