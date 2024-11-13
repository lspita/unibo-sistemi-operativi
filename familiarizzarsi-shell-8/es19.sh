echo "19. scrivere quattro script bash main.sh definisci.sh usa.sh ed elimina.sh che \
svolgono queste operazioni: definisci.sh crea la variabile d'ambiente VAR e ne \
setta il contenuto a \"INIZIO\", usa.sh stampa a video il contenuto della variabile \
VAR, elimina.sh elimina dall'ambiente di esecuzione la variabile VAR, mentre \
main.sh chiama opportunamente i tre script definisci.sh usa.sh ed elimina.sh in \
modo da creare nel proprio ambiente di esecuzione la stringa VAR, di stamparne a \
video il contenuto e di eliminare la variabile dal proprio ambiente di esecuzione. \
Infine main.sh chiama ancora opportunamente lo script usa.sh per verificare se la \
variabile VAR è stata effettivamente eliminata."
set -v

chmod +x ./main.sh
./main.sh

set +v
