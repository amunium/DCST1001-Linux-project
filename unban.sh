#!/bin/bash

# Denne filen har en loop som periodisk sjekker database.db om noen av de lagrede ipadressene er for gamle og fjerner dem


# Muligens jeg hjelper deg litt:
# Dette kan være kommandoen for for unban hvor "$ipAdress" er en variabel som skal inneholde ipen du hentet fra database.db som skal unbannes
# iptables -D INPUT -s $ipAdress -j DROP # Tror det er et problem med den, men skal ikke være for vanskelig å finne ut av det.

while true
do 
    clear
    # check if any ip is 10 min old (600 sec)
    echo "Checking if any banned IP address is too old"
    nowTime=$(date +%s)
    oldTime=$((nowTime - 600))
    echo "Time when check: "$nowTime
    # grep for å finne tid spesifikt: grep [0-9]{4,} <her setter du inn det du skal sjekke>
    
    database="miniban.db"

    lineNum=1
    while read line
    do  
        # Get IP address from line
        ipAdress=${line%,*}
        # Get ipTime from line
        ipTime=${line#*,}
        echo $line
        if [ $ipTime -le $oldTime ]
        then
            echo "Removed ban on: "$ipAdress
            iptables -D INPUT -s $ipAdress -j DROP
            #TODO remove from database
            eval $(sed -i "/$lineNum/d" miniban.db)
        fi
        lineNum=$((lineNum+1))
    done < $database
    # Waits some time
    sleep 3
done