echo "Realizzare uno script bash contaseparatamente.sh che effettua le seguenti \
operazioni:
Lo script prende un numero variabile di argomenti, al massimo 9.
Ciascun argomento è il nome di un file.
Lo script scrive sullo standard output il numero totale di righe dei file passati \
come argomenti di indice pari.
Lo script scrive sullo standard error il numero totale di righe dei file passati \
come argomenti di indice dispari.
Realizzare poi uno script bash lancia.sh che:
lancia l'esecuzione dello script contaseparatamente.sh passando allo script come \
argomenti i primi 7 file che si ottengono come standard output del comando ls \
-S1 /usr/include/*.h
Il modo in cui lo script lancia.sh lancia l'esecuzione di contaseparatamente.sh \
deve ridirezionare sia lo standard output che lo standard error di \
contaseparatamente.sh sullo standard error di lancia.sh stesso.
Mi raccomando, verificare che lo script lancia.sh produca il suo output sullo \
standard error."
set -v

chmod +x ./lancia.sh
./lancia.sh `ls -S1 /usr/include/*.h | head -n 7`

# proof that output is on standard error
./lancia.sh `ls -S1 /usr/include/*.h | head -n 7` 2>out.txt
cat out.txt

rm out.txt

set +v
