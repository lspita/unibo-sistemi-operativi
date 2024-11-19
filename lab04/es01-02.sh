echo "1. Scrivere uno script cercadir.sh che cerca tra tutti i file e directory contenuti \
nella directory /usr/include (non nelle sue sottodirectory) e stampa in output il percorso \
assoluto dei file che verificano tutte le seguenti proprietà: a) sono delle directory, b) \
hanno il permesso di lettura da parte dello user attuale, c) la data di ultima modifica \
del file è strettamente più recente di quella del file /usr/include/stdio.h "
set -v

chmod +x ./cercadir.sh
./cercadir.sh

set +v
echo "2. Scrivere uno script cercafile.sh che, per ciascuna lettera che sta tra c e g \
cerca i file (o directory) che stanno nella directory /usr/include (non nelle sottodirectory) \ 
e che hanno quella lettera come secondo carattere del nome del file, e che verificano \
una delle due seguenti proprietà: la lunghezza del percorso assoluto del file è \
minore di 18 OPPURE è maggiore di 23. Di questi file stampa in output il percorso \
assoluto."
set -v

chmod +x ./cercafile.sh
./cercafile.sh

set +v
