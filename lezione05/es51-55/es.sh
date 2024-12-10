echo "51.Scrivere uno script puntini.sh che prende come argomento a riga di comando \
un intero positivo che rappresenta un certo numero di secondi. Lo script deve \
rimanere in esecuzione per quel numero di secondi e, ad ogni secondo, stampare a \
video un punto . seguito dal proprio PID. Ma senza andare a capo."
set -v

chmod +x puntini.sh
./puntini.sh 5

set +v
echo "52.Eseguire lo script precedente passandogli un argomento intero >= 30. Poi \
digitare alcuni comandi per sospendere lo script e mandarlo in background, poi \
riportarlo in foreground e poi dopo una decina di secondi sospenderlo e riportarlo \
in background. Infine killare lo script usando il suo pid (process identifier)."
set -v

./puntini.sh 31 # press ctrl-z to suspend process

bg %1
sleep 2 # wait

# press ctrl-z to suspend process again
fg %1

bg %1
JOB_PID=$!
sleep 2 # wait

kill -9 ${JOB_PID}

set +v
echo "53.Eseguire lo script in modo da mandarlo direttamente in background subito, \
senza sospenderlo. Poi killare lo script."
set -v

./puntini.sh 31 &
JOB_PID=$!

sleep 2 # wait
kill -9 ${JOB_PID}

set +v
echo "54.Creare altri due script, lanciaekilla.sh e lanciaeprendipid.sh. Lo script \
lanciaeprendipid.sh deve lanciare in background 10 istanze dello script precedente \
puntini.sh ridirigendo l'output di questi script sullo standard error.
Per ciascuno degli script puntini.sh lanciati, lo script lanciaeprendipid.sh deve \
ottenere il PID del processo lanciato. I 10 PID li deve mandare sullo standard \
output separati da spazi.
Lo script lanciaekilla.sh invece deve lanciare in modo opportuno lo script \
lanciaeprendipid.sh, deve catturare l'output di questo e visualizzare l'elenco dei \
PID ottenuti.
Poi deve usare i PID ottenuti per killare uno alla volta i processi puntini.sh \
lanciati da lanciaeprendipid.sh ."
set -v

chmod +x lanciaekilla.sh
./lanciaekilla.sh

set +v
echo "55.Creare uno script lanciaricorsivo.sh che necessita di un unico argomento \
intero che è il numero totale di processi discendenti che rimangono ancora da \
lanciare. Se il numero di discendenti da lanciare è maggiore di zero allora lo \
script lancia in background una nuova istanza di sé stesso passando come argomento \
il proprio argomento diminuito di 1.
Lanciato il figlio, il padre visualizza in output il pid del figlio, poi aspetta \
che il proprio figlio termini la propria esecuzione.
Il figlio nel frattempo crea un suo figlio (un nipote del primo) il quale etc etc. \
Lanciare inizialmente lo script passandogli 5 come argomento."
set -v

chmod +x lanciaricorsivo.sh
./lanciaricorsivo.sh 5

set +v
unset JOB_PID
