# Denne filen har en loop som periodisk sjekker database.db om noen av de lagrede ipadressene er for gamle og fjerner dem


# Muligens jeg hjelper deg litt:
# Dette kan være kommandoen for for unban hvor "$ipAdress" er en variabel som skal inneholde ipen du hentet fra database.db som skal unbannes
# iptables -D INPUT -s $ipAdress -j DROP # Tror det er et problem med den, men skal ikke være for vanskelig å finne ut av det.

while true
do 
    # måles i sekunder
    sleep 1
    # check if any ip is 10 min old (600 sec)
    echo "Checking if any banned IP address is too old"
    
    time = $(date +%s)

    # grep for å finne tid spesifikt: grep [0-9]{4,} <her setter du inn det du skal sjekke>

    # TODO: for loop
    for each line in miniban.db 
        ipTime = #TODO
        oldTime = $((time - 600))


        if [$newTime -le $oldTime ]
        then
            echo "Removed ban on: "$ipAdress
            iptables -D INPUT -s $ipAdress -j DROP
            # TODO remove from database
        fi
done