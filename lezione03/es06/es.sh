echo "6. Scrivere uno script script1.sh che prende a riga di comando un numero variabile di \
argomenti. Lo script visualizza sullo standard output tutti gli argomenti e poi invoca \
un altro script script2.sh passandogli tutti gli argomenti ricevuti. Anche il secondo \
script visualizza gli argomenti, ma in ordine inverso, poi termina. Eseguire lo \
script1.sh passandogli come argomenti a b "c d" e f "
set -v

chmod +x ./script1.sh
./script1.sh a b "c d" e f

set +v
