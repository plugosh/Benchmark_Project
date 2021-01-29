#!/bin/bash

chmod +x ./Scripts/BP_* #making all BP_ project files as executeable

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

cd Scripts #changing directory

#Error control
if [ ! -x ./BP_CheckCurrentVersion.sh ! -x ./BP_FullScan.sh -o ! -x ./BP_CheckForSoftwares.sh -o ! -x ./BP_SoftwareFiltering.sh -o ! -x ./BP_InstallSoftwares.sh -o ! -x ./BP_UpdateSoftwares.sh ] ; then
	echo "Error. One of program scripts can not be executed."
	exit 0
fi

#apt-get update bool, by default false
agubool=false

echo -e "\e[1m\e[34mWelcome to Software Updater by Plugosh and Gungo\e[0m"

echo -e "\e[1m\e[31mBefore using this program please use 'apt-get update' command\e[0m"
echo -e "\e[1m\e[31mThis program could not work properly without applying 'apt-get update command'.\e[0m"
echo -n "Has the command 'apt-get update' already been used? [Y/n]: "	#Asking if a-g update has been used
read -n1 ans
echo ""
echo ""


if [ $ans == "n" -o $ans == "N" ] ; then
	echo -n "Do you want to apply 'apt-get update' now? [Y/n]: "	#Asking user if he wants to execute a-g update command
	read -n1 ans2
	echo ""
	echo ""

	if [ $ans2 == "y" -o $ans2 == "Y" ] ; then
		sudo apt-get update
		agubool=true	#setting agubool as true

	else
		agubool=false	#setting agubool as false
	fi


elif [ $ans == "y" -o $ans == "Y" ] ; then
	agubool=true 	#setting agubool as true

else
	agubool=false 	#setting agubool as false
fi

if [ $agubool == "false" ] ; then
	echo "This program could not work properly without applying 'apt-get update command'."	#warning about possible errors
	echo ""
	echo -n "Do you still want to continue? Choosing option 'no' will terminate this program [Y/n]: "	#final ask in case aguboll=false
	read -n1 ans3
	echo ""
	if [ $ans3 == "n" -o $ans3 == "N" ] ; then
		echo "Process terminated by user"	#terminating process
		exit 100 
	fi
fi

#Checking system version, not really needed

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

echo -n "Do you want to check if our recomended softwares are installed and up to date on your OS? [Y/n]: "	
read -n1 ans100
echo ""

if [ $ans100 == "y" -o $ans100 == "Y" ] ; then
	echo -e "\e[34mScanning in progress. Please wait.\e[0m"

	./BP_CheckForSoftwares.sh 	#executing BP_CheckForSoftwares
	./BP_SoftwareFiltering.sh 	#executing BP_SoftwareFiltering
	
	echo ""

	if [ `wc -l < ./BPDF_NotInstalledSoftwares.txt` -gt 0 ] ; then
		echo "Some of recomended softwares are not installed on your OS."
		echo -n "Do you want to install them automatically? [Y/n]: " 		#asking if user wants to install recomended softwares
		read -n1 ans4
		echo ""

	fi
	
		echo ""

	if [ `wc -l < ./BPDF_OutdatedSoftwares.txt` -gt 0 ] ; then
		echo "Some of recomended softwares are not up to date on your OS."
		echo -n "Do you want to update them automatically? [Y/n]: "		#asking if user wants to uptade recomended softwares
		read -n1 ans5
		echo ""
	fi
	
	if [ $ans4 == "y" -o $ans4 == "Y" ] ; then
		echo -e "\e[1m\e[34mProgram is going to install missing packets. Please wait.\e[0m"
		echo -e "\e[1mInstallation will be performed by sudo apt-get install command.\e[0m"
		echo -e "\e[1mYou may need to enter your user password to continue.\e[0m"
		echo -e "\e[1mSome softwares will need your permission to install.\e[0m"
		echo ""

		./BP_InstallSoftwares.sh 	#executing BP_InstallSoftwares
	fi
	
	if [ $ans5 == "y" -o $ans5 == "Y" ] ; then
		echo -e "\e[1m\e[34mProgram is going to update outdated packets. Please wait.\e[0m"
		./BP_UpdateSoftwares.sh  	#executing BP_UpdateSoftwares
		echo ""
	fi
fi

echo ""

scounter=`dpkg -l | wc -l`
scounter=$[scounter - 6]

echo -e "You have \e[1m$scounter\e[0m installed softwares that may need to be updated."
echo -e "Do you want to update \e[1m\e[31mALL\e[0m packets installed on your system?"
echo -e "You may need to interact with the system."
echo -e "Only packages that will be affected are these outdated."
echo -e "Time to update all packages may take a long time [Y/n]: "
read -n1 ans50
echo ""

if [ $ans50 == "y" -o $ans50 == "Y" ] ; then

	./BP_FullScan.sh  	#executing BP_FullScan
	echo ""
fi

#cleaning all files

> BPDF_NotInstalledSoftwares.txt 
> BPD_FullList.txt
> BPD_NotInstalledSoftwares.txt
> BPD_SystemVersionData.txt
> BPDF_OutdatedSoftwares.txt
> BPDF_UpToDateSoftwares.txt
> BPD_SoftwaresData.txt



cd ..