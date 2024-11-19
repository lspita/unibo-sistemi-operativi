echo "4. Scrivere un piccolo script chiama_fattoriale.sh il quale invoca lo script \
fattoriale.sh passandogli l’argomento 5 e cattura dallo stdout il risultato prodotto \
dal fattoriale, mettendolo in una variabile denominata RISULTATO. Scrivere poi lo \
script fattoriale.sh che prende in input un argomento intero positivo e calcola il \
fattoriale di quel numero. Lo script fattoriale.sh scrive il risultato sullo stdout."
set -v

chmod +x ./chiama_fattoriale.sh
./chiama_fattoriale.sh

set +v
echo "5. COMPLICATO Partendo dall’esercizio precedente, scrivere uno script \
chiama_fattoriale1.sh il quale crea una variabile condivisa RIS, invoca in \
modo opportuno lo script fattoriale1.sh passandogli l’argomento 5, ottiene il \
risultato che viene messo dallo script fattoriale1.sh nella variabile RIS e ne stampa a \
video il contenuto. Scrivere uno script fattoriale1.sh che chiami sé stesso \
ricorsivamente per calcolare il fattoriale del numero passato come argomento. A \
differenza del caso precedente, il risultato di ogni invocazione deve essere scritto in \
una variabile condivisa (in entrambe le direzioni) tra chiamante e chiamato di nome RIS."
set -v

chmod +x ./chiama_fattoriale1.sh
./chiama_fattoriale1.sh

set +v

