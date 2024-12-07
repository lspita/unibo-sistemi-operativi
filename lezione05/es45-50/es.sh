echo "45) scrivere una riga di comando che mette sullo standard output le righe che stanno tra la 3° e la 5° \
posizione nel file /usr/include/stdio.h"
set -v

head -n 5 /usr/include/stdio.h | tail -n 3

set +v
echo "46) scrivere una riga di comando che mette sullo standard output delle righe con i primi 3 caratteri delle \
ultime 4 righe del file /usr/include/stdio.h"
set -v

tail -n 4 /usr/include/stdio.h | sed -r "s/(.{3}).*/\1/"

set +v
echo "47) scrivere una riga di comando che legge due righe da standard input e le mette in output in ordine \
invertito."
set -v

read R1; read R2; echo ${R2}; echo ${R1}

set +v
echo "48) scrivere una riga di comando che legge una riga da standard input e mette in output niente"
set -v

read ROW # you can add stdout redirection to /dev/null but it is not required

set +v
echo "49) scrivere una riga di comando che legge righe da standard input e per ciascuna di queste mette in \
output il numero di caratteri che la compongono."
set -v

while read ROW; do echo ${#ROW}; done

set +v
echo "50) usare in sequenza le precedenti prime 2 righe di comando per generare output da passare come standard \
input all'insieme delle precedenti righe di comando (quelli dal terzo al quinto in quest'ordine), eseguiti in \
sequenza."
set -v

(
head -n 5 /usr/include/stdio.h | tail -n 3;
tail -n 4 /usr/include/stdio.h | sed -r "s/(.{3}).*/\1/"
) | (
read R1; read R2; echo ${R2}; echo ${R1};
read ROW > /dev/null
while read ROW; do echo ${#ROW}; done;
)

set +v
