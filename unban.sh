#!/bin/bash

# Denne filen har en loop som periodisk sjekker database.db om noen av de lagrede ipadressene er for gamle og fjerner dem


# Muligens jeg hjelper deg litt:
# Dette kan være kommandoen for for unban hvor "$ipAdress" er en variabel som skal inneholde ipen du hentet fra database.db som skal unbannes
# iptables -D INPUT -s $ipAdress -j DROP # Tror det er et problem med den, men skal ikke være for vanskelig å finne ut av det.

while true
do 
    clear
    # Get time
    nowTime=$(date +%s)
    oldTime=$((nowTime - 600))
    
    database="miniban.db"

    lineNum=1
    while read line
    do  
        # Get IP address from line
        ipAdress=${line%,*}
        # Get ipTime from line
        ipTime=${line#*,}
        # Check if ban is old
        if [ $ipTime -le $oldTime ]
        then
            echo "Removed ban on: "$ipAdress >> journal.txt
            iptables -D INPUT -s $ipAdress -j DROP
            eval $(sed -i "/$lineNum/d" miniban.db)
        fi
        lineNum=$((lineNum+1))
    done < $database
    # Waits some time
    sleep 3
done