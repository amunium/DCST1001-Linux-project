#!/bin/bash

# Denne kalles med en ipadresse som skal bli bannet som argument (sjekk "calling bash file with argument") og lagrer dette med timestamp i database.db
# $1 er ipadressen som skal bli bannet


# Check if whitelist.db containes ip
white=false
whitelist="whitelist.db"
while read line
do
    if [ "$line" == "$1" ]
    then
        #Say that it is indeed whitelisted
        echo "--> Ban failed. $1 is whitelisted" >> ipaddresses.txt
        white=true
    fi
done < $whitelist

if [ $white = false ]
then
    # If ip not whitelisted, will be banned.
    #Ban ip address using iptables
    iptables -A INPUT -s $1 -j DROP

    #add ip address to database.db
    echo $1","$(date +%s) >> miniban.db

    # report completed banning and exit without error
    # echo "New IP banned: "$1
fi

# Reporting on all currently banned ip addresses: iptables -L INPUT -v -n
