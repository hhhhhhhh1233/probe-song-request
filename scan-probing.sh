#!/bin/bash

airmon-ng start wlan0

MACS=(':f1:5a ' ':c8:a1 ' ':3d:73 ' ':a4:f2 ':c0:38 ' ':1f:21 ')
SONG=('tim' 'tage' 'mikke' 'linus' 'lukas' 'elias')

while [ : ]; do
	TSHARK_RESULTS=$(tshark -c 20 -i wlan0mon | grep "Probe Request")
	COUNTER=0
	for MAC_ITEM in "${MACS[@]}"; do
		if [[ $TSHARK_RESULTS == *$MAC_ITEM* ]]; then
			#FOUND ACTIVITY FROM THE SPECIFIED MAC ADDRESS
			echo "$MAC_ITEM is Probing"
			curl -X GET 192.168.10.59:3000/${SONG[$COUNTER]}
		else
			#DID NOT FIND ACTIVITY FROM THE SPECIFIED MAC ADDRESS
			echo "$MAC_ITEM is not Probing"
		fi
		COUNTER=$(($COUNTER + 1))
	done
done
