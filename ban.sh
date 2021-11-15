# Denne kalles med en ipadresse som skal bli bannet som argument (sjekk "calling bash file with argument") og lagrer dette med timestamp i database.db

ipAdress=$1



cat $ipAdress >> database.db