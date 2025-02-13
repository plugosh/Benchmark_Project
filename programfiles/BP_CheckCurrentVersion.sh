#!/bin/bash

#Error Control
if [ ! -e ./BPD_SystemVersionData.txt ] ; then
	touch ./BPD_SystemVersionData.txt
	chmod +w ./BPD_SystemVersionData.txt
	if [ ! -w ./BPD_SystemVersionData.txt ] ; then
		echo "Error. Can not write into BPD_SystemVersionData.txt file."
		exit 0
	fi

else
	chmod +w ./BPD_SystemVersionData.txt
	if [ ! -w ./BPD_SystemVersionData.txt ] ; then
		echo "Error. Can not write into BPD_SystemVersionData.txt file."
		exit 0
	fi
fi

#Checking current version
for FILE in /etc/*release; do
  cat "$FILE" | grep "NAME=" > ./BPD_SystemVersionData.txt
  cat "$FILE" | grep "VERSION=" >> ./BPD_SystemVersionData.txt	#check current system version

done

#checking language

cat /etc/default/locale >> ./BPD_SystemVersionData.txt
