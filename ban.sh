# Denne kalles med en ipadresse som skal bli bannet som argument (sjekk "calling bash file with argument") og lagrer dette med timestamp i database.db
# $1 er ipadressen som skal bli bannet

#Ban ip address using iptables
iptables -A INPUT -s $1 -j DROP

#add ip address to database.db
echo $1","$(date +%s) >> miniban.db

#report completed banning and exit without error
echo "New IP banned: "$1

echo "Reporting on banned ip addresses:"
iptables -L INPUT -v -n

exit 0
