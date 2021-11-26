#!/bin/bash

clear

# When killed will kill all child processes and delete tempfiles
trap finish EXIT

function finish {
	rm -rf "ipaddresses.txt"
	rm -rf "lockfile.lck"
	rm -rf "nohup.out"
	kill 0
}

# Start unban.sh as daemon
nohup ./unban.sh &

# setup journal.txt
now=$(date "+%Y-%m-%d %H:%M:%S")

rm journal.txt

journalctl -u ssh --since "$now" > journal.txt

num=1

echo "" > ipaddresses.txt

# Start main loop
for (( ; ; ))
do


# ------------------------------------------------Going in to the loop---------------------------------------------------------------------- #

# Three different variables. "ip" is just a random ip address so "iprep" has a value to search for in journal.txt.
ip=00.00.00.00

# "iprep" counts the number of failed attempts from the last registered ip address
iprep=$(grep -oc $ip journal.txt)

# "ipnum" counts the number of ip addresses in journal.txt
ipnum=$(egrep -oc "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" journal.txt)


while [ $(($iprep % 3)) != 0 -o $iprep -eq 0 ]
do
	# "VAR" is used for the loading animation in the script. VAR cycles through the values {0,1,2} and run search 3,2,1 in this order. 
VAR=0

	# "num" is just a number that increases together with "ipnum" so when "ipnum" increases the script will jump out of the while loop.
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
./ban.sh $ip &




done

