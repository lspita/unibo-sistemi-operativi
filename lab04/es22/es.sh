echo "22. Scrivere uno script bash leggere.sh che legge le righe del file \
/usr/include/stdio.h e stampa a video la sola terza parola di ciascuna riga, \
o niente se la terza parola non esiste"
set -v

chmod +x ./leggere.sh
./leggere.sh

set +v
