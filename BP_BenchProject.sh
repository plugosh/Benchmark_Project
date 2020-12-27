#!/bin/bash
chmod +x ./BP_* #making all BP_ project files as executeable

echo -e "                                    "
echo -e "                    \e[7m\e[95m██████\e[0m          "
echo -e "                  \e[7m\e[95m██▓▓▓▓▓▓██\e[0m        "
echo -e "                \e[7m\e[95m██▓▓▓▓▒▒▒▒██\e[0m        "
echo -e "                \e[7m\e[95m██▓▓▒▒▒▒▒▒██\e[0m        "
echo -e "              \e[7m\e[95m██▓▓▓▓▒▒▒▒██\e[0m          "
echo -e "              \e[7m\e[95m██▓▓▒▒▒▒▒▒██\e[0m          "
echo -e "            \e[7m\e[95m██▓▓▓▓▒▒▒▒▒▒██\e[0m          "
echo -e "            \e[7m\e[95m████▒▒████▒▒██\e[0m          "
echo -e "            \e[7m\e[95m██▓▓▒▒▒▒▒▒▒▒██\e[0m          "
echo -e "          \e[7m\e[95m██    \e[95m▒▒    \e[95m▒▒██\e[0m          "
echo -e "          \e[7m\e[95m████  ▒▒██  ▒▒██\e[0m          "
echo -e "          \e[7m\e[95m██    ▒▒    ▒▒██\e[0m          "
echo -e "          \e[7m\e[95m██▒▒▒▒▒▒▒▒▒▒▒▒██\e[0m          "
echo -e "          \e[7m\e[95m████████████▒▒▒▒██\e[0m        "
echo -e "        \e[7m\e[95m██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██\e[0m      "
echo -e "      \e[7m\e[95m██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒██\e[0m    "
echo -e "    \e[7m\e[95m██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██\e[0m  "
echo -e "  \e[7m\e[95m██▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██\e[0m"
echo -e "\e[7m\e[95m██▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒██\e[0m"
echo -e "\e[7m\e[95m██▓▓▒▒▓▓▒▒▒▒▒▒\e[30m▓▓▓▓\e[95m▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒██\e[0m"
echo -e "\e[7m\e[95m██▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██\e[0m"
echo -e "  \e[7m\e[92m████▐▌\e[95m▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\e[92m▐▌▐▌████\e[0m  "
echo -e "    \e[7m\e[92m██▐▌▐▌▌▌▌▌▌▌▌▌▐▌▐▌▐▌▐▌▌▌▐▌██\e[0m    "
echo -e "    \e[7m\e[92m██▌▌▐▌▐▌▌▌▐▌▌▌▌▌▐▌▌▌▌▌▌▌▌▌██\e[0m    "
echo -e "      \e[7m\e[92m██▌▌▐▌▐▌▐▌▐▌▐▌▐▌▐▌▌▌▌▌██\e[0m      "
echo -e "      \e[7m\e[92m██▐▌▐▌▐▌████████▐▌▌▌▌▌██\e[0m      "
echo -e "        \e[7m\e[95m██▒▒██\e[0m        \e[7m\e[95m██▒▒██\e[0m        "
echo -e "        \e[7m\e[95m██████\e[0m        \e[7m\e[95m██████\e[0m        "
echo -e "                                    "

agubool=false

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
	echo -n "Do you still want to continue? Choosing option 'no' will terminate the program [Y/n]: "
	read -n1 ans3
	echo ""
	if [ $ans3 == "n" -o $ans3 == "N" ] ; then
		echo "Process terminated by user"
		exit 100 
	fi
fi

if [ ! -e ./BP_CheckCurrentVersion.sh ] ; then
	echo "Error. File 'BP_CheckCurrentVersion.sh' is not valid."
	exit 0
fi

./BP_CheckCurrentVersion.sh	#check current system version

#./BP_CheckForSoftwares.sh #look for specific installed softwares

if [ ! -e ./BP_CheckForSoftwares.sh ] ; then
	echo "Error. File 'BP_CheckForSoftwares.sh' is not valid."
	exit 0
fi

./BP_CheckForSoftwares.sh