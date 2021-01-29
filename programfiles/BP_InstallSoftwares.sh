#!/bin/bash

#Error control
if [ ! -e ./BPDF_NotInstalledSoftwares.txt ] ; then
	echo "Error. BPDF_NotInstalledSoftwares.txt file is not valid."
	exit 0
fi

if [ ! -r ./BPDF_NotInstalledSoftwares.txt ] ; then
	echo "Error. Can not read BPDF_NotInstalledSoftwares.txt file."
	exit 0
fi

echo ""
echo -e "\e[1m\e[34mInstallation in progess.\e[0m"
echo ""

#Count the number of not installed softwares
length=`wc -l < ./BPDF_NotInstalledSoftwares.txt`

for (( i = 1; i <= $length ; i++ ))
do
	nisoft=`sed -n ${i}p ./BPDF_NotInstalledSoftwares.txt`
	echo -e "\e[1m\e[36mSoftware to install: \e[0m\e[95m$nisoft.\e[0m"
	echo ""
	sudo apt-get install -y "$nisoft" 	#Installing softwares
done

