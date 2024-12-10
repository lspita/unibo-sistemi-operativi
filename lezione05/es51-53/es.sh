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
unset JOB_PID
