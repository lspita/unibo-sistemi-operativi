echo "Realizzare uno script asterischi.sh che conta quante sono le righe che \
contengono almeno un asterisco * in tutti i file il cui nome termina con .h nella \
parte di filesystem a partire dalla directory /usr/include/

Lo script deve stampare sul proprio standard error il numero delle righe contate."
set -v

chmod +x ./asterischi.sh
./asterischi.sh

set +v
