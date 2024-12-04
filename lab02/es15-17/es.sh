echo "15. Usare il comando man per studiare le opzioni del comando ls."
set -v

man ls

set +v
echo "16. Usare ls e le sue opzioni per visualizzare tutti i file nella \
directory /usr/include/ e nelle sue sottodirectory."
set -v

ls -alhR /usr/include

set +v
echo "17. Usare ls e le sue opzioni per visualizzare le informazioni di una \
directory /usr/include/ senza visualizzare tutti i file nella directory"
set -v

ls -dlh /usr/include

set +v
