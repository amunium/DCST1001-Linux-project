# Denne skal lytte etter ssh tilkoblinger og kalle "ban.sh" når den oppdager 3 fails

trap "./unban" EXIT

while(true)
    journalctl -u ssh

    tempfile = mkdir $tempfile

    trap "./ban ipadresse" EXIT



trap "" EXIT