echo "45) scrivere una riga di comando che mette sullo standard output le righe che stanno tra la 3° e la 5° \
posizione nel file /usr/include/stdio.h"
set -v

head -n 5 /usr/include/stdio.h | tail -n 3

set +v
echo "46) scrivere una riga di comando che mette sullo standard output delle righe con i primi 3 caratteri delle \
ultime 4 righe del file /usr/include/stdio.h"
set -v

tail -n 4 /usr/include/stdio.h | sed -r "s/(.{3}).*/\1/"

set +v
