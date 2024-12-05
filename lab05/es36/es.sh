echo "36. Scrivere uno script random.sh che controlla ripetutamente il valore della \
variabile RANDOM e conta quante volte la variabile viene letta. Lo script si \
interrompe quando la variabile RANDOM assume un valore tale che la divisione modulo \
10 di RANDOM valga esattamente 2. Prima di terminare, lo script scrive in output \
il numero di volte che la variabile e’ stata controllata."
set -v

chmod +x ./random.sh
./random.sh

set +v
