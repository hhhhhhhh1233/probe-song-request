#!/bin/bash

#SKRIV SISTA TVÅ SEGMENT AV MACADDRESSEN
MAC="f1:5a"

while [ : ]; do
    if [[ $(tshark -c 20 | grep "Probe Request") == *$MAC* ]]; then
        #FOUND ACTIVITY FROM THE SPECIFIED MAC ADDRESS
        echo "$MAC is Probing"

    else
        #DID NOT FIND ACTIVITY FROM THE SPECIFIED MAC ADDRESS
        echo "$MAC is not Probing"

    fi
done