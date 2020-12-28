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




for (( n=1; $n <= $SoftwareData/3 ; n++ ))
do
	SNL=$[n+(n-1)*2]
	SoftName=`sed -n ${SNL}p ./BPD_SoftwaresData.txt | tr -d ':'`

	SCIV=$[1+n+(n-1)*2]
	SoftInsVer=`sed -n ${SCIV}p ./BPD_SoftwaresData.txt | tr -d ':'` #ZROB W OBU TUTAJ CUT 

	SNV=$[2+n+(n-1)*2]
	SoftNewVer=`sed -n ${SNV}p ./BPD_SoftwaresData.txt | tr -d ':'`

done

#	1	4	7	10
#	1	2	3	4
#
#	2	5	8	11
#
#
#