echo "4. Scrivere uno script bash, di nome crea_var.sh, che crea una variabile \
di nome PIPPO la quale contiene la concatenazione dei contenuti delle variabili \
USER HOME DISPLAY"
set +v

chmod +x ./crea_var.sh
./crea_var.sh

set -v
echo "5. Dall'interno di una shell bash, eseguire lo script crea_var.sh in modo tale che \
la variabile PIPPO sia presente (col nuovo contenuto) dentro la bash chiamante dopo la \
fine dell'esecuzione dello script crea_var.sh"
set -v

source crea_var.sh
echo ${PIPPO}

set +v
unset PIPPO