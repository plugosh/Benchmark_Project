#!/bin/bash
chmod +x ./BP_* #making all BP_ project files as executeable

echo "Before using this program please use 'apt-get update' command"

./BP_CheckCurrentVersion.sh	#check current system version

#./BP_CheckForSoftwares.sh #look for specific installed softwares

./BP_CheckForSoftwares.sh