#!/bin/bash


now=$(date "+%Y-%m-%d %H:%M:%S")

clear

rm journal.txt



journalctl -u ssh --since "$now" | grep "Failed password for" > journal.txt


ipzero=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)


#---------------------------------loop 1---------------------------


while (( $ipzero!=1))
do
(flock -x 100
        journalctl -u ssh --since "$now" | grep -m 1 "Failed password for" >> journal.txt
) 100>lockfile.lck

(flock -x 100
sleep 1
) 100>lockfile.lck
        ipzero=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)
done
# DEILIG ^ funke

ip=$(sort -r journal.txt | egrep -o -m 1 "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)
# -r: reverse order, -o: only exact match, -m: max number of items, -egrep: can take in complex orders

echo Failed login from $ip

#---------------------------------loop 2---------------------------

now=$(date "+%Y-%m-%d %H:%M:%S")


while (( $ipzero!=2))
do
(flock -x 100
        journalctl -u ssh --since "$now" | grep -m 1 "Failed password for" >> journal.txt
) 100>lockfile.lck
       
(flock -x 100
sleep 1
) 100>lockfile.lck
        ipzero=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)
done
# DEILIG ^ funke

ip=$(sort -r journal.txt | egrep -o -m 1 "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)
# -r: reverse order, -o: only exact match, -m: max number of items, -egrep: can take in complex orders

echo Failed login from $ip

#---------------------------------loop 3---------------------------

now=$(date "+%Y-%m-%d %H:%M:%S")


while (( $ipzero!=3))
do
(flock -x 100
        journalctl -u ssh --since "$now" | grep -m 1 "Failed password for" >> journal.txt
) 100>lockfile.lck
      
(flock -x 100
sleep 1
) 100>lockfile.lck
        ipzero=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)
done
# DEILIG ^ funke

ip=$(sort -r journal.txt | egrep -o -m 1 "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)
# -r: reverse order, -o: only exact match, -m: max number of items, -egrep: can take in complex orders

echo Third failed login from $ip - banning ip address.
# call ban.sh
./ban.sh $ip
