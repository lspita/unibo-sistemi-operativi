echo "57. Scrivere uno script separa.sh che
- separa i diversi percorsi contenuti nella variabile di ambiente PATH (che vi \
ricordo sono separati da : ).
- e li visualizza uno per uno sullo standard output, ciascun percorso trovato in \
una riga di output che dopo il percorso contiene la lunghezza del percorso."
set -v

chmod +x ./separa.sh
./separa.sh

set +v
