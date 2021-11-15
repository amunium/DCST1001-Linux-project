# Denne kalles med en ipadresse som skal bli bannet som argument (sjekk "calling bash file with argument") og lagrer dette med timestamp i database.db

# Get ip address from arg
ipAdress=$1
echo "Starting ban of: "$ipAdress

#Ban ip address using iptables


#add ip address to database.db
tid=$(date +%s)
echo $ipAdress","$tid >> database.db

#report completed banning
echo "Completed ban of: "$ipAdress

# Exit without error
exit 0