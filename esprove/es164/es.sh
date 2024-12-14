echo "Scrivere un file di testo input1.txt in cui in ciascuna riga c'é una parola, \
seguita da una virgola, seguita da un numero intero maggiore o uguale a zero, \
seguito da una virgola, seguito da un'altra parola.
Ad esempio, il file input1.txt passato assieme al testo dell'esercizio contiene:

gatto,52,vacca
alfa,31,triangolo
orto,9,bici
zappa,69,guzzi
disco,12,celentano

Realizzare uno script estrai.sh che stampa a video le righe lette dal file \
input1.txt ma senza i numeri in mezzo a ciascuna riga e senza la virgola che segue \
il numero.
Infine, stampa a video la somma dei numeri che non ha visualizzato.
Qui sotto ecco cosa deve apparire a video usando il file input1.txt di esempio.

gatto, vacca
alfa, triangolo
orto, bici
zappa, guzzi
disco, celentano
173"
set -v

chmod +x ./estrai.sh
./estrai.sh

set +v
