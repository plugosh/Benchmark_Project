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

for (( n=1; $n <= $SoftwareData/3 ; n++ ))
do
	SNL=$[n+(n-1)*2]
	SoftName=`sed -n ${SNL}p ./BPD_SoftwaresData.txt | tr -d ':'`

	SCIV=$[1+n+(n-1)*2]
	SoftInsVer=`sed -n ${SCIV}p ./BPD_SoftwaresData.txt | cut -d ' ' -f4-` #PL & EN

	if [ $ISPL -gt 0 ] ; then

		SNV=$[2+n+(n-1)*2]
		SoftNewVer=`sed -n ${SNV}p ./BPD_SoftwaresData.txt | cut -d ' ' -f6-`	#PL

	elif [ $ISEN -gt -0 ] ; then

		SNV=$[2+n+(n-1)*2]
		SoftNewVer=`sed -n ${SNV}p ./BPD_SoftwaresData.txt | cut -d ' ' -f4-`	#EN

	else
		SNV=$[2+n+(n-1)*2]
		SoftNewVer=`sed -n ${SNV}p ./BPD_SoftwaresData.txt | cut -d ' ' -f4-`	#May be errors
	fi


	aSoftware[n-1]="$SoftName"
	aSoftInst[n-1]="$SoftInsVer"
	aSoftNewV[n-1]="$SoftNewVer"

	#echo "${aSoftware[n-1]}"
	#echo "${aSoftInst[n-1]}"
	#echo "${aSoftNewV[n-1]}"


	if [ ${aSoftInst[n-1]} == "(brak)" -o ${aSoftInst[n-1]} == "(none)" ] ; then	#PL and EN
		echo "niezainstalowane dla ${aSoftware[n-1]}"
	else
		echo "${aSoftInst[n-1]} ${aSoftware[n-1]}"
	fi

done

	#PL:								EN:
	#software 							software
	#	Zainstalowana:	(brak)				Installed:	(none)
	#	Kandydująca:	1.2.3.4				Candidate:	1.2.3.4
	#or
	#	Zainstalowana:	1.2.3.3				Installed:	1.2.3.3