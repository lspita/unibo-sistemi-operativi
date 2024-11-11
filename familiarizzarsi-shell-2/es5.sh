echo "5. Dall'interno di una shell bash, eseguire lo script crea_var.sh in modo tale che \
la variabile PIPPO sia presente (col nuovo contenuto) dentro la bash chiamante dopo la \
fine dell'esecuzione dello script crea_var.sh"
set -v

source crea_var.sh
echo ${PIPPO}

set +v
unset PIPPO