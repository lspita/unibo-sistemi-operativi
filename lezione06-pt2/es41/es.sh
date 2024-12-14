echo "Scrivere uno script bash cercarecente.sh che comincia cercando tutti i file \
con estensione .h in tutte le sottodirectory della directory /usr/include/linux/ \
escludendo i files che si trovano direttamente nella directory /usr/include/linux/
Confrontare la data di ultima modifica dei file così trovati e stampare a video il \
nome del file modificato più recentemente."
set -v

chmod +x ./cercarecente.sh
./cercarecente.sh

set +v
