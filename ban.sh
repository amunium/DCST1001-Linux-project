# Denne kalles med en ipadresse som skal bli bannet som argument (sjekk "calling bash file with argument") og lagrer dette med timestamp i database.db

# Get ip address from arg
ipAdress=$1
echo "Starting ban of: "$ipAdress

#Ban ip address using iptables
sudo iptables -A INPUT -s $ipAdress -j DROP

#add ip address to database.db
tid=$(date +%s)
echo $ipAdress","$tid >> database.db

#report completed banning and exit without error
echo "New IP banned: "$ipAdress

echo "Reporting on banned ip addresses:"
sudo iptables -L INPUT -v -n

exit 0