echo "3. Scrivere un comando che crea una nuova variabile di nome PIPPO \
la quale contiene la concatenazione dei contenuti delle variabili USER HOME DISPLAY"
set -v

PIPPO="${USER} ${HOME} ${DISPLAY}"

set +v
unset PIPPO