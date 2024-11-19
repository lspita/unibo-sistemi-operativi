echo "22. Creare tre file con spazio.txt senzaspazio1.txt e senzaspazio2.txt \
(notare lo spazio presente tra le lettere n ed s del nome del file con \
spazio.txt )."
set -v

touch "con spazio.txt"
touch "senzaspazio1.txt"
touch "senzaspazio2.txt"

set +v
echo "23. scrivere due script lancia.sh e stampaargs.sh.
Lo script lancia.sh determina il numero degli argomenti che gli sono stati \
passati a riga di comando ed esegue lo script stampaargs.sh passandogli come \
primo argomento il numero di argomenti trovato seguito da tutti gli argomenti \
che erano stati passati a lancia.sh stesso.
Lo script stampaargs.sh stampa a video gli argomenti che ha ricevuto a riga \
di comando, ciascuno in una diversa riga di output.
Lanciare lo script lancia.sh passandogli i nomi di tutti i file il cui nome \
contiene la stringa spazio, e verificare se lo script stampaargs.sh stampa \
correttamente a video il numero di argomenti ed il nome dei files passati a \
lancia.sh"
set -v

chmod +x ./lancia.sh
./lancia.sh *spazio*

set +v
echo "24. Ripetere l'esercizio precedente, creando analogamente due file \
lancia2.sh e stampaargs2.sh. Stavolta però il file lancia2.sh non passa gli \
argomenti a stampaargs2.sh nella riga di comandi, bensì in una variabile \
d'ambiente NOMIFILES appositamente creata per lo script stampaargs2.sh.
Verificare SE E' POSSIBILE identificare bene i confini dei nomi di files \
(risposta NO)."
set -v

chmod +x ./lancia2.sh
./lancia2.sh *spazio*

set +v
echo "25. Usare il comando rm per eliminare i 3 files che hanno la stringa \
spazio nel nome"
set -v

rm *spazio*

set +v
