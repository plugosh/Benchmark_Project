#!/bin/bash


if [ ! -e ./BPD_SoftwaresData.txt ] ; then
	touch ./BPD_SoftwaresData.txt
	chmod +w ./BPD_SoftwaresData.txt
	if [ ! -w ./BPD_SoftwaresData.txt ] ; then
		echo "Error. Can not write into BPD_SoftwaresData.txt file."
		exit 0
	fi

else
	chmod +w ./BPD_SoftwaresData.txt
	if [ ! -w ./BPD_SoftwaresData.txt ] ; then
		echo "Error. Can not write into BPD_SoftwaresData.txt file."
		exit 0
	fi
fi

#TUTAJ PETLA CZYTAJACA PROGRAMY Z BPB_SOFTWARE LIST
SoftwareCount=`wc -l < ./BPB_SoftwareList.txt`

> BPD_SoftwaresData.txt

for (( n=1; $n <= $SoftwareCount/2+1 ; n++ ))
do
	apt-cache policy `sed -n ${n}p ./BPB_SoftwareList.txt` | head -3 >> BPD_SoftwaresData.txt
done

	#PL:								EN:
	#software 							software
	#	Zainstalowana:	(brak)				Installed:	(none)
	#	Kandydująca:	1.2.3.4				Candidate:	1.2.3.4
	#or
	#	Zainstalowana:	1.2.3.3				Installed:	1.2.3.3