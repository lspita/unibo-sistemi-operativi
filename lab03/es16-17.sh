echo "16. Scrivere uno script bash argomenti.sh che prende in input un numero \
qualsiasi di argomenti e stampa a video una stringa formata dalla concatenazione \
degli argomenti di indice pari seguiti dagli argomenti di indice dispari."
set -v

chmod +x ./argomenti.sh
./argomenti.sh ciao a "tutti come" va

set +v
echo "17. Nello script precedente provare a passare un ; come argomento e correggere \
eventuali errori."
set -v

./argomenti.sh ciao a tutti come ";" ";;" va

set +v
