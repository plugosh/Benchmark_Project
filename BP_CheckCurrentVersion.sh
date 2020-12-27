#!/bin/bash



for FILE in /etc/*release; do
  cat "$FILE" | grep "NAME=" > ./BPD_SystemVersionData.txt
  cat "$FILE" | grep "VERSION=" >> ./BPD_SystemVersionData.txt	#check current system version

done