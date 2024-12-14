echo "I due file RisultatiProvaPratica1.txt e RisultatiProvaPratica2.txt contengono \
in ciascuna riga di testo il Nome, il Cognome, la Matricola e il Voto ottenuti dallo \
studente nellla prova pratica N° 1 e N° 2 rispettivamente. Ciascun Nome e ciascun \
Cognome è composto da una sola parola. Il numero di matricola è univoco. Il Cognome \
e il nome, invece, potrebbero essere ripetuti. Il voto può essere non sufficiente ( \
voto < 18).
Scrivere uno script bash insuff2.sh che metta in output l'elenco dei soli studenti \
che rispettano TUTTE le seguenti caratteristiche:
--- Hanno sostenuto la seconda prova prativa, ottenendo un voto NON sufficiente,
--- Non hanno sostenuto la prima prova pratica.
L'output deve essere formattato su più righe di testo. Ciascuna riga contiene le \
informazioni su uno studente, in particolare la Matricola, il Nome, il Cognome ed \
il voto ottenuto nella seconda prova pratica, in quest'ordine. Le righe dell'output \
devono essere ordinate secondo il Cognome, in senso crescente.
Esempio di file:"
set -v

cat RisultatiProvaPratica1.txt

cat RisultatiProvaPratica2.txt

# Example output:
# 888888 Sante Bo 14
# 333333 Paolo Venzi 9

chmod +x ./insuff2.sh
./insuff2.sh

set +v
