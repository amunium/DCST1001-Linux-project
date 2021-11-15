# Denne kalles med en ipadresse som skal bli bannet som argument (sjekk "calling bash file with argument") og lagrer dette med timestamp i database.db

# Henter argumentet den henter fra
ipAdress=$1

echo $ipAdress




echo $ipAdress >> database.db