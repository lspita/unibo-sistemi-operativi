echo "43) Usando wget scaricare lo script bash al seguente URL: \
http://www.cs.unibo.it/~ghini/didattica/sistemioperativi/ESERCIZI/esprcond_errato.sh"
set -v

wget -O esprcond_errato.sh http://www.cs.unibo.it/~ghini/didattica/sistemioperativi/ESERCIZI/esprcond_errato.sh
cat esprcond_errato.sh

set +v
echo "44)Verificare se lo script precedentemente scaricato esprcond_errato.sh funziona correttamente oppure \
produce errori. Correggere gli eventuali errori."
set -v

chmod +x esprcond_errato.sh
./esprcond_errato.sh

# the error is that the script is missing spaces in the if statement
cat esprcond_corretto.sh

chmod +x esprcond_corretto.sh
./esprcond_corretto.sh

diff --color esprcond_errato.sh esprcond_corretto.sh

rm esprcond_errato.sh

set +v
