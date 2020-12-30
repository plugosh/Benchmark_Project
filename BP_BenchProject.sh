#!/bin/bash

chmod +x ./BP_* #making all BP_ project files as executeable

echo -e "                                    "
echo -e "                    \e[7m\e[95m██████\e[0m     "
echo -e "                  \e[7m\e[95m██▓▓▓▓▓▓██\e[0m     "
echo -e "                \e[7m\e[95m██▓▓▓▓▒▒▒▒██\e[0m     "
echo -e "                \e[7m\e[95m██▓▓▒▒▒▒▒▒██\e[0m     "
echo -e "              \e[7m\e[95m██▓▓▓▓▒▒▒▒██\e[0m     "
echo -e "              \e[7m\e[95m██▓▓▒▒▒▒▒▒██\e[0m     "
echo -e "            \e[7m\e[95m██▓▓▓▓▒▒▒▒▒▒██\e[0m     "
echo -e "            \e[7m\e[95m████▒▒████▒▒██\e[0m     "
echo -e "            \e[7m\e[95m██▓▓▒▒▒▒▒▒▒▒██\e[0m     "
echo -e "          \e[7m\e[95m██    \e[95m▒▒    \e[95m▒▒██\e[0m     "
echo -e "          \e[7m\e[95m████  ▒▒██  ▒▒██\e[0m     "
echo -e "          \e[7m\e[95m██    ▒▒    ▒▒██\e[0m     "
echo -e "          \e[7m\e[95m██▒▒▒▒▒▒▒▒▒▒▒▒██\e[0m     "
echo -e "          \e[7m\e[95m████████████▒▒▒▒██\e[0m     "
echo -e "        \e[7m\e[95m██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██\e[0m     "
echo -e "      \e[7m\e[95m██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒██\e[0m     "
echo -e "    \e[7m\e[95m██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██\e[0m     "
echo -e "  \e[7m\e[95m██▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██\e[0m     "
echo -e "\e[7m\e[95m██▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██\e[0m     "
echo -e "\e[7m\e[95m██▓▓▒▒▓▓▒▒▒▒▒▒\e[30m▓▓▓▓\e[95m▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒██\e[0m     "
echo -e "\e[7m\e[95m██▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██\e[0m     "
echo -e "  \e[7m\e[92m████▐▌\e[95m▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\e[92m▐▌▐▌████\e[0m     "
echo -e "    \e[7m\e[92m██▐▌▐▌▌▌▌▌▌▌▌▌▐▌▐▌▐▌▐▌▌▌▐▌██\e[0m     "
echo -e "    \e[7m\e[92m██▌▌▐▌▐▌▌▌▐▌▌▌▌▌▐▌▌▌▌▌▌▌▌▌██\e[0m     "
echo -e "      \e[7m\e[92m██▌▌▐▌▐▌▐▌▐▌▐▌▐▌▐▌▌▌▌▌██\e[0m     "
echo -e "      \e[7m\e[92m██▐▌▐▌▐▌████████▐▌▌▌▌▌██\e[0m     "
echo -e "        \e[7m\e[95m██▒▒██\e[0m        \e[7m\e[95m██▒▒██\e[0m      "
echo -e "        \e[7m\e[95m██████\e[0m        \e[7m\e[95m██████\e[0m      "
echo -e "                                    "

if [ ! -x ./BP_CheckCurrentVersion.sh -o ! -x ./BP_CheckForSoftwares.sh -o ! -x ./BP_SoftwareFiltering.sh -o ! -x ./BP_InstallSoftwares.sh -o ! -x ./BP_UpdateSoftwares.sh ] ; then
	echo "Error. One of program scripts can not be executed."
	exit 0
fi

agubool=false

echo -e "\e[1m\e[34mWelcome to Software Updater by Plugosh and Gungo\e[0m"

echo -e "\e[1m\e[31mBefore using this program please use 'apt-get update' command\e[0m"
echo -e "\e[1m\e[31mThis program could not work properly without applying 'apt-get update command'.\e[0m"
echo -n "Has the command 'apt-get update' already been used? [Y/n]: "
read -n1 ans
echo ""
echo ""


if [ $ans == "n" -o $ans == "N" ] ; then
	echo -n "Do you want to apply 'apt-get update' now? [Y/n]: "
	read -n1 ans2
	echo ""
	echo ""

	if [ $ans2 == "y" -o $ans2 == "Y" ] ; then
		sudo apt-get update
		agubool=true

	else
		agubool=false
	fi


elif [ $ans == "y" -o $ans == "Y" ] ; then
	agubool=true

else
	agubool=false
fi

if [ $agubool == "false" ] ; then
	echo "This program could not work properly without applying 'apt-get update command'."
	echo ""
	echo -n "Do you still want to continue? Choosing option 'no' will terminate this program [Y/n]: "
	read -n1 ans3
	echo ""
	if [ $ans3 == "n" -o $ans3 == "N" ] ; then
		echo "Process terminated by user"
		exit 100 
	fi
fi

#Checking system version

if [ ! -e ./BP_CheckCurrentVersion.sh ] ; then
	echo "\e[41mError. File 'BP_CheckCurrentVersion.sh' is not valid."
	exit 0
fi

./BP_CheckCurrentVersion.sh	#check current system version

#Checking for recomended softwares

if [ ! -e ./BP_CheckForSoftwares.sh ] ; then
	echo "\e[41mError. File 'BP_CheckForSoftwares.sh' is not valid."
	exit 0
fi

echo -e "\e[34mScanning in progress. Please wait.\e[0m"

./BP_CheckForSoftwares.sh
./BP_SoftwareFiltering.sh

echo ""

if [ `wc -l < ./BPDF_NotInstalledSoftwares.txt` -gt 0 ] ; then
	echo "Some of recomended softwares are not installed on your OS."
	echo -n "Do you want to install them automatically? [Y/n]: "
	read -n1 ans4
	echo ""
fi

if [ `wc -l < ./BPDF_NotInstalledSoftwares.txt` -gt 0 ] ; then
	echo "Some of recomended softwares are not up to date on your OS."
	echo -n "Do you want to update them automatically? [Y/n]: "
	read -n1 ans5
	echo ""
fi

if [ $ans4 == "y" -o $ans4 == "Y" ] ; then
	echo -e "\e[1m\e[34mProgram is going to install missing packets. Please wait.\e[0m"
	./BP_InstallSoftwares.sh
fi

if [ $ans5 == "y" -o $ans5 == "Y" ] ; then
	echo -e "\e[1m\e[34mProgram is going to update outdated packets. Please wait.\e[0m"
	./BP_UpdateSoftwares.sh
fi