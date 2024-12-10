echo "33) Visualizzare a video il nome dei file che soddisfano due condizioni 1) \
stanno nelle directory immediatamente figlie della directory /usr/include/ 2) hanno \
nome che termina con net.h"
set -v

find /usr/include -maxdepth 1 -name "*net.h"

set +v
echo "34) Visualizzare a video le prime tre righe di ciascun file che sta nella \
directory /usr/include/ e in tutte le sue sottodirectory. Attenzione alle directory."
set -v

find /usr/include -type f -exec head -n 3 "{}" ";"

set +v
echo "35) Aggiungere un comando in pipe al comando precedente per visualizzare solo \
i primi 3 caratteri di ciascuna riga."
set -v

find /usr/include -type f -exec head -n 3 "{}" ";" | cut -c -3

set +v
