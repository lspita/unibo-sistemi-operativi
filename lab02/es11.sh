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
