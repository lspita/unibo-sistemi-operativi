echo "38. Scrivere un file contenente alcune (almeno 5) righe di testo, ciascuna \
con almeno 4 parole. Scrivere uno script seconda.sh che prende come unico argomento \
il nome di quel file. Dentro lo script utilizzare ripetutamente il comando read per \
leggere la seconda parola di ogni riga del file. Tutte le seconde parole devono \
essere concatenata in una variabile di nome OUT. Alla fine dello script, la \
variabile OUT deve essere visualizzata sullo standard output."
set -v

# test text
cat test.txt

chmod +x ./seconda.sh
./seconda.sh test.txt

set +v
echo "39. Scrivere un file di testo che contenga almeno 5 righe. Passare il \
contenuto del file nello standard input di uno script seleziona.sh. Lo script deve \
selezionare le sole righe che contengono almeno un carattere A e contare il numero \
di caratteri totali delle sole righe selezionate. Suggerimento: guardate cosa fa \
il comando wc -c"
set -v

chmod +x seleziona.sh
./seleziona.sh < test.txt

set +v
