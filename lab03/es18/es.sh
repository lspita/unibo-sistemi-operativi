echo "18. Scrivere uno script bash sommaquadrati.sh che prende in input un numero \
qualsiasi di argomenti interi positivi e stampa a video il numero intero dato dalla \
somma dei quadrati dei singoli argomenti diminuito della somma degli indici degli \
argomenti."
set -v

chmod +x ./sommaquadrati.sh
./sommaquadrati.sh 1 2 5 0 3 # (1+4+25+0+9)-(1+2+3+4+5) = 39-15 = 24

set +v
