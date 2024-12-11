echo "58. Scrivere uno script backslash.sh che riceve righe di testo dallo standard \
input. Lo script deve leggere ciascuna riga e modificarla, aggiungendo davanti a \
ciascun metacarattere * ? [ ] un bel carattere backslash \ . Lo script deve mandare \
sullo standard output ciascuna riga modificata"
set -v

chmod +x ./backslash.sh
./backslash.sh

set +v
