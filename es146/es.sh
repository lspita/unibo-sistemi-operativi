echo "Implementare due script bash lancia.sh e figlio.sh. Lo script lancia.sh imposta tutto \
quello che serve e poi lancia in esecuzione lo script figlio.sh (lo penso come se \
avesse indice i==1) SENZA passargli argomenti a riga di comando, e poi termina. \
Il primo script figlio.sh (i==1) a sua volta lancia lo script figlio.sh (i==2) SENZA \
passargli argomenti a riga di comando e poi termina.
Ciascuno script figlio (i-esimo) lancia in esecuzione lo script figlio.sh ((i+1)-esimo) \
SENZA passargli argomenti a riga di comando, e poi termina.
La sequenza di script uno figlio dell'altro termina quando in totale sono stati messi in \
esecuzione 10 script figlio.sh più lo script iniziale lancia.sh.

Ciascun i-esimo script figlio.sh deve mettere in output il proprio pid.
Dopo di questo, se i è maggiore di 10 allora lo script termina; se invece i è minore o \
uguale a 10 allora lo script lancia lo script figlio.sh e poi termina."
set -v

chmod +x ./lancia.sh
./lancia.sh

set +v
