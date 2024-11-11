echo "18. Creare una sottodirectory BUTTAMI e crearci dentro due file \
AbC.txt e ABC.txt"
set -v

mkdir BUTTAMI
touch BUTTAMI/AbC.txt
touch BUTTAMI/ABC.txt

set +v
echo "19. Eliminare il file appena creato ABC.txt"
set -v

rm BUTTAMI/ABC.txt

set +v
echo "20. Eliminare, con un unico comando, la directory BUTTAMI e tutti i \
files in essa contenuti."
set -v

rm -rf BUTTAMI

set +v
