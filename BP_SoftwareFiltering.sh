#!/bin/bash

if [ ! -e ./BPD_SoftwaresData.txt ] ; then
	echo "Error. BPD_SoftwaresData.txt file is not valid."
	exit 0
fi

if [ ! -r ./BPD_SoftwaresData.txt ] ; then
	echo "Error. Can not read BPD_SoftwaresData.txt file."
	exit 0
fi

SoftwareData=`wc -l < ./BPD_SoftwaresData.txt`

#CHECKING LANGUAGE

PLG=`cat /etc/default/locale | grep "pl_"`
ELG=`cat /etc/default/locale | grep "en_"`

ISPL=${#PLG}
ISEN=${#ELG}

#counters
countUpToDate=0
countOutdated=0
countNotInstalled=0

for (( n=1; $n <= $[SoftwareData/3] ; n++ ))
do
	SNL=$[n+(n-1)*2]
	SoftName=`sed -n ${SNL}p ./BPD_SoftwaresData.txt | tr -d ':'`

	SCIV=$[1+n+(n-1)*2]
	SoftInsVer=`sed -n ${SCIV}p ./BPD_SoftwaresData.txt | cut -d ' ' -f4-` #PL & EN

	SNV=$[2+n+(n-1)*2]

	if [ $ISPL -gt 0 ] ; then

		SoftNewVer=`sed -n ${SNV}p ./BPD_SoftwaresData.txt | cut -d ' ' -f6-`	#PL

	elif [ $ISEN -gt -0 ] ; then

		SoftNewVer=`sed -n ${SNV}p ./BPD_SoftwaresData.txt | cut -d ' ' -f4-`	#EN

	else
		SoftNewVer=`sed -n ${SNV}p ./BPD_SoftwaresData.txt | cut -d ' ' -f4-`	#May be errors
	fi


	aSoftware[n-1]="$SoftName"
	aSoftInst[n-1]="$SoftInsVer"
	aSoftNewV[n-1]="$SoftNewVer"

	echo "${aSoftware[n-1]}"
	#echo "${aSoftInst[n-1]}"
	#echo "${aSoftNewV[n-1]}"


	if [ ${aSoftInst[n-1]} == "(brak)" -o ${aSoftInst[n-1]} == "(none)" ] ; then	#PL and EN
		aNotInstalled[countNotInstalled]=${aSoftware[n-1]}
		countNotInstalled=$[countNotInstalled+1]
		#echo "not installed ${aSoftware[n-1]}"
	else
		if [ ${aSoftInst[n-1]} == ${aSoftNewV[n-1]} ] ; then
			aUpToDate[countUpToDatent]=${aSoftware[n-1]}
			countUpToDate=$[countUpToDate+1]
			echo "up ${aSoftware[n-1]}"
		else
			aOutdated[countOutdated]=${aSoftware[n-1]}
			countOutdated=$[countOutdated+1]
			#echo "outdated ${aSoftware[n-1]} xxxxx ${aSoftInst[n-1]} xxxxx ${aSoftNewV[n-1]}"
		fi
	fi

done


if [ $countNotInstalled -gt 0 ] ; then
	echo -e "\e[91mList of not installed recomended softwares:\e[0m"
	for (( i=0 ; $i<${#aNotInstalled[@]} ; i++ ))
	do
		echo -e "\e[91m${aNotInstalled[i]}\e[0m"
	done
fi

if [ $countOutdated -gt 0 ] ; then
	echo -e "\e[93mList of recomended softwares that are installed and outdated:\e[0m"
	for (( j=0 ; $j<${#aOutdated[@]} ; j++ ))
	do
		echo -e "\e[93m${aOutdated[j]}\e[0m"
	done
fi

if [ $countUpToDate -gt 0 ] ; then
	echo -e "\e[92mList of recomended installed softwares that are up to date:\e[0m"
	for (( k=0 ; $k<${#aUpToDate[@]} ; k++ ))
	do
		echo -e "\e[92m${aUpToDate[k]}\e[0m"
	done
fi

#${#array[@]}



	#PL:								EN:
	#software 							software
	#	Zainstalowana:	(brak)				Installed:	(none)
	#	Kandydująca:	1.2.3.4				Candidate:	1.2.3.4
	#or
	#	Zainstalowana:	1.2.3.3				Installed:	1.2.3.3