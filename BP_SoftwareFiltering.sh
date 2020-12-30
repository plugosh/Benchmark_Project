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

#ERROR CONTROL

if [ ! -e ./BPDF_NotInstalledSoftwares.txt ] ; then
	touch ./BPDF_NotInstalledSoftwares.txt
	chmod +w ./BPDF_NotInstalledSoftwares.txt
	if [ ! -w ./BPDF_NotInstalledSoftwares.txt ] ; then
		echo "Error. Can not write into BPDF_NotInstalledSoftwares.txt file."
		exit 0
	fi

else
	chmod +w ./BPDF_NotInstalledSoftwares.txt
	if [ ! -w ./BPDF_NotInstalledSoftwares.txt ] ; then
		echo "Error. Can not write into BPDF_NotInstalledSoftwares.txt file."
		exit 0
	fi
fi

#ERROR CONTROL

if [ ! -e ./BPDF_OutdatedSoftwares.txt ] ; then
	touch ./BPDF_OutdatedSoftwares.txt
	chmod +w ./BPDF_OutdatedSoftwares.txt
	if [ ! -w ./BPDF_OutdatedSoftwares.txt ] ; then
		echo "Error. Can not write into BPDF_OutdatedSoftwares.txt file."
		exit 0
	fi

else
	chmod +w ./BPDF_OutdatedSoftwares.txt
	if [ ! -w ./BPDF_OutdatedSoftwares.txt ] ; then
		echo "Error. Can not write into BPDF_OutdatedSoftwares.txt file."
		exit 0
	fi
fi

#ERROR CONTROL

if [ ! -e ./BPDF_UpToDateSoftwares.txt ] ; then
	touch ./BPDF_UpToDateSoftwares.txt
	chmod +w ./BPDF_UpToDateSoftwares.txt
	if [ ! -w ./BPDF_UpToDateSoftwares.txt ] ; then
		echo "Error. Can not write into BPDF_UpToDateSoftwares.txt file."
		exit 0
	fi

else
	chmod +w ./BPDF_UpToDateSoftwares.txt
	if [ ! -w ./BPDF_UpToDateSoftwares.txt ] ; then
		echo "Error. Can not write into BPDF_UpToDateSoftwares.txt file."
		exit 0
	fi
fi

> BPDF_NotInstalledSoftwares.txt
> BPDF_OutdatedSoftwares.txt
> BPDF_UpToDateSoftwares.txt



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

	#echo "${aSoftware[n-1]}"
	#echo "${aSoftInst[n-1]}"
	#echo "${aSoftNewV[n-1]}"


	if [ ${aSoftInst[n-1]} == "(brak)" -o ${aSoftInst[n-1]} == "(none)" ] ; then	#PL and EN
		aNotInstalled[countNotInstalled]=${aSoftware[n-1]}
		aNewest_Version_Not_Installed[countNotInstalled]=${aSoftNewV[n-1]}
		countNotInstalled=$[countNotInstalled+1]
		echo "${aSoftware[n-1]}" >> BPDF_NotInstalledSoftwares.txt
	else
		if [ ${aSoftInst[n-1]} == ${aSoftNewV[n-1]} ] ; then
			aUpToDate[countUpToDate]=${aSoftware[n-1]}
			aNewest_Up_To_Date[countUpToDate]=${aSoftNewV[n-1]}
			countUpToDate=$[countUpToDate+1]
			echo "${aSoftware[n-1]}" >> BPDF_UpToDateSoftwares.txt
			#echo "up ${aSoftware[n-1]}"
		else
			aOutdated[countOutdated]=${aSoftware[n-1]}
			aNewest_Version_Outdated[countOutdated]=${aSoftNewV[n-1]}
			aInstalled_Outdated[countOutdated]=${aSoftInst[n-1]}
			countOutdated=$[countOutdated+1]
			echo "${aSoftware[n-1]}" >> BPDF_OutdatedSoftwares.txt
			#echo "outdated ${aSoftware[n-1]} xxxxx ${aSoftInst[n-1]} xxxxx ${aSoftNewV[n-1]}"
		fi
	fi

done

echo ""

if [ $countNotInstalled -gt 0 ] ; then
	echo -e "\e[1m\e[91mList of not installed recomended softwares:\e[0m"
	for (( i=0 ; $i<${#aNotInstalled[@]} ; i++ ))
	do
		if [ ${#aNotInstalled[i]} -lt 8 ] ; then
			echo -e "\e[91m${aNotInstalled[i]}\t\t newest version is: ${aNewest_Version_Not_Installed[i]} \e[0m"
		else
			echo -e "\e[91m${aNotInstalled[i]}\t newest version is: ${aNewest_Version_Not_Installed[i]} \e[0m"
		fi
	done
fi

echo ""

if [ $countOutdated -gt 0 ] ; then
	echo -e "\e[1m\e[93mList of recomended softwares that are installed and outdated:\e[0m"
	for (( j=0 ; $j<${#aOutdated[@]} ; j++ ))
	do
		if [ ${#aOutdated[j]} -lt 8 ] ; then
			echo -e "\e[93m${aOutdated[j]}\t\t newest version is: ${aNewest_Version_Outdated[j]} and your version is: ${aInstalled_Outdated[j]}\e[0m"
		else
			echo -e "\e[93m${aOutdated[j]}\t newest version is: ${aNewest_Version_Outdated[j]} and your version is: ${aInstalled_Outdated[j]}\e[0m"
		fi
	done
fi

echo ""

if [ $countUpToDate -gt 0 ] ; then
	echo -e "\e[1m\e[92mList of recomended installed softwares that are up to date:\e[0m"
	for (( k=0 ; $k<${#aUpToDate[@]} ; k++ ))
	do
		if [ ${#aUpToDate[k]} -lt 8 ] ; then
			echo -e "\e[92m${aUpToDate[k]}\t\t newest version is: ${aNewest_Up_To_Date[k]}\e[0m"
		else
			echo -e "\e[92m${aUpToDate[k]}\t newest version is: ${aNewest_Up_To_Date[k]}\e[0m"
		fi
	done
fi

#${#array[@]}



	#PL:								EN:
	#software 							software
	#	Zainstalowana:	(brak)				Installed:	(none)
	#	Kandydująca:	1.2.3.4				Candidate:	1.2.3.4
	#or
	#	Zainstalowana:	1.2.3.3				Installed:	1.2.3.3