#!/bin/bash
chmod +x ./BP_* #making all BP_ project files as executeable

./BP_CheckCurrentVersion.sh	#check current system version

cat ./BPD_SystemVersionData.txt | grep "NAME="
cat ./BPD_SystemVersionData.txt | grep "VERSION="

#./BP_CheckForSoftwares.sh #look for specific installed softwares

./BP_CheckForSoftwares.sh