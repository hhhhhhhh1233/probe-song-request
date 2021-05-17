#!/bin/bash


MACS=(':aa:aa ' ':bb:bb ' ':cc:cc ' ':dd:dd ' ':ee:ee ' ':ff:ff ')
SONG=('person1' 'person2' 'person3' 'person4' 'person5' 'person6')

MONITOR_CARD=<THE WIRELESS INTERFACE FOR MONITORING>

NODE_SERVER=<IP ADDRESS OF WEB SERVER>


airmon-ng start $MONITOR_CARD

while [ : ]; do
	TSHARK_RESULTS=$(tshark -c 20 -i wlan0mon | grep "Probe Request")
	COUNTER=0
	for MAC_ITEM in "${MACS[@]}"; do
		if [[ $TSHARK_RESULTS == *$MAC_ITEM* ]]; then
			echo "$MAC_ITEM is Probing"
			curl -X GET $NODE_SERVER/${SONG[$COUNTER]}
		else
			echo "$MAC_ITEM is not Probing"
		fi
		COUNTER=$(($COUNTER + 1))
	done
done
