#!/bin/bash

clear

# trap "./unban.sh" EXIT


now=$(date "+%Y-%m-%d %H:%M:%S")

rm journal.txt

journalctl -u ssh --since "$now" > journal.txt

num=1

echo "" > ipaddresses.txt

for (( ; ; ))
do


# ------------------------------------------------Going in to the loop---------------------------------------------------------------------- #

ip=00.00.00.00

iprep=$(grep -oc $ip journal.txt)

ipnum=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)


while [ $iprep -le 2 ]
do
VAR=0

                      while (( $ipnum != $num ))
        do
       

if [[ $VAR -gt 1 ]]
then

        # ------------------search 3--------------------
       	clear
                echo MiniBan version 9.9.9		[Showing results found since: "$now"]
                echo Searching . . .
        cat ipaddresses.txt

        (flock -x 100
 journalctl -u ssh --since "$now" | grep -m 1 "Failed password for" >> journal.txt
        ) 100>lockfile.lck
	sleep 1
        (flock -x 100
       sleep 1
        ) 100>lockfile.lck
                ipnum=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)

        VAR=0


elif [[ $VAR = 1 ]]
then

        # ------------------search 2--------------------
       	clear
		echo MiniBan version 9.9.9		[Showing results found since: "$now"]
                echo Searching . .
        cat ipaddresses.txt

        (flock -x 100
 journalctl -u ssh --since "$now" | grep -m 1 "Failed password for" >> journal.txt
        ) 100>lockfile.lck

        (flock -x 100
       sleep 1
        ) 100>lockfile.lck
                ipnum=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)

        VAR=$(($VAR+1))


else

	# ------------------search 1--------------------
	clear
                echo MiniBan version 9.9.9		[Showing results found since: "$now"]
                echo Searching .
        cat ipaddresses.txt

        (flock -x 100
 journalctl -u ssh --since "$now" | grep -m 1 "Failed password for" >> journal.txt
        ) 100>lockfile.lck

        (flock -x 100
       sleep 1
        ) 100>lockfile.lck
                ipnum=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)


        VAR=$(($VAR+1))


fi

 # DEILIG ^ funke

        done #inner

        ip=$(egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt | tail -1) 
	echo Found $ip >> ipaddresses.txt


num=$(($num+1))

now=$(date "+%Y-%m-%d %H:%M:%S")

iprep=$(grep -oc $ip journal.txt)


done #outer

echo "--> Banning "$ip >> ipaddresses.txt





done
