#!/bin/bash


#TUTAJ PETLA CZYTAJACA PROGRAMY Z BPB_SOFTWARE LIST
SoftwareCount=`wc -l < ./BPB_SoftwareList.txt`

> BPD_SoftwaresData.txt



for (( n=1; $n <= $SoftwareCount/2+1 ; n++ ))
do
	apt-cache policy `sed -n ${n}p ./BPB_SoftwareList.txt` >> BPD_SoftwaresData.txt
done

#ZAPIS ICH DO BPD_SOFTWAREDATA.TXT
#ZAPISAC TRZEBA NAJLEPIEJ PIERWSZE 3 LINIJKI - NAZWA PROGRAMU, ZAINSTALOWANA WERSJA, AKTUALNA WERSJA