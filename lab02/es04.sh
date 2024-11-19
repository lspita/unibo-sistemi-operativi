echo "4. Scrivere uno script bash, di nome crea_var.sh, che crea una variabile \
di nome PIPPO la quale contiene la concatenazione dei contenuti delle variabili \
USER HOME DISPLAY"
set +v

chmod +x ./crea_var.sh
./crea_var.sh

set -v