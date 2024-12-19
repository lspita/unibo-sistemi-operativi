echo "ESERCIZIO C - Somma di numeri in un file:
Scrivi uno script che legge un file contenente numeri interi (uno per riga) \
e stampa a video due somme, cioè la somma dei numeri nelle righe di indice \
pari e la somma dei numeri nelle righe di indice dispari."
set -v

cat numeri.txt

chmod +x ./sommafile.sh
./sommafile.sh numeri.txt # expected: odd 142, even 127 

set +v
