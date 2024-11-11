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
