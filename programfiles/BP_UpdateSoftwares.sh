#!/bin/bash

#BPDF_NotInstalledSoftwares.txt
#BPDF_OutdatedSoftwares.txt
#BPDF_UpToDateSoftwares.txt

#Error control
if [ ! -e ./BPDF_OutdatedSoftwares.txt ] ; then
	echo "Error. BPDF_OutdatedSoftwares.txt file is not valid."
	exit 0
fi

if [ ! -r ./BPDF_OutdatedSoftwares.txt ] ; then
	echo "Error. Can not read BPDF_OutdatedSoftwares.txt file."
	exit 0
fi

echo ""
echo -e "\e[1m\e[34mInstallation in progess.\e[0m"
echo ""

#Checking the number of outdated softwares
length=`wc -l < ./BPDF_OutdatedSoftwares.txt`


#This loop is updating softwares
for (( i = 1; i <= $length ; i++ ))
do
	odsoft=`sed -n ${i}p ./BPDF_OutdatedSoftwares.txt`
	echo -e "\e[1m\e[36mSoftware to install: \e[0m\e[95m$nisoft.\e[0m"
	echo ""
	sudo apt-get install -y "$odsoft"
done

