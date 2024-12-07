echo "11. Usare il comando set per disabilitare la memorizzazione di history. \
Poi lanciare un comando qualsiasi e poi lanciare history e verificare che \
quel comando non è stato memorizzato. Infine, usare il comando set per \
riabilitare la memorizzazione di history."
set -v

history
set +o history
ls
history
# ls is not present
set -o history
ls -h
history
# ls -h is present

set +v
echo "12. Usare il comando set per abilitare la creazione di variabili \
d'ambiente e verificare se funziona (inventarsi un modo per testare se le \
variabili sono create come var d'ambiente oppure no)"
set -v

set -a
PIPPO="pippo"
env | grep "PIPPO"
set +a
PLUTO="pluto"
env | grep "PLUTO" # should be not found

set +v
unset PIPPO
unset PLUTO
