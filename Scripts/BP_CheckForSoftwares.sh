#!/bin/bash

#Error control
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

#Loop that is checking and writing recomended softwares versions into BPD_SoftwareData.txt file
SoftwareCount=`wc -l < ./BPB_SoftwareList.txt`

> BPD_SoftwaresData.txt

for (( n=1; n <= $SoftwareCount/2+1 ; n++ ))
do
	apt-cache policy `sed -n ${n}p ./BPB_SoftwareList.txt` | head -3 >> BPD_SoftwaresData.txt
done

