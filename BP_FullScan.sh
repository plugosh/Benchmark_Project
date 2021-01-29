#!/bin/bash

> BPD_FullList.txt
> BPDAF_ToUpdate.txt

fail=0
success=0

dpkg -l | cut -d ' ' -f3-3 >> ./BPD_FullList.txt

Linecounter=`wc -l < ./BPD_FullList.txt`


PLG=`cat /etc/default/locale | grep "pl_"`
ELG=`cat /etc/default/locale | grep "en_"`

ISPL=${#PLG}
ISEN=${#ELG}

LCount=$(($Linecounter-6))

TUpd=0
n=0



	echo -e "\e[93m\e[1mUpdating in progress."
for (( i = 7; i <=Linecounter; i++ )); do

	echo -e "____________________________________________________________________"

	sudo apt-get install -y `sed -n ${i}p ./BPD_FullList.txt`
	
	progress=$(( $i * 100 / $LCount ))
	echo -ne "$progress % of your $LCount programs have been checked\r"

done

echo -e "\e[92mUpdating finished successfully.\e[0m"




	
