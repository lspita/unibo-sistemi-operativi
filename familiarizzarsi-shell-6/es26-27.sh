echo "26) Scrivere uno script che esegue i seguenti compiti:
- Creare una directory BUTTAMI, dentro questa creare dei file che si chiamano
* ** *** ;;
- Fare un listing di questi file e poi, per ciascuno dei file nella directory \
aggiungere un nuovo file con stesso nome con in più l'estensione .txt.
- Copiare in questa directory tutta la directory /usr/include/ (e i suoi file \
e sottodirectory ricorsivamente).
- Stampare a video tutte le sottodirectory (non i file) della vostra \
directory BUTTAMI comprese le sottodirectory delle sottodirectory e così via \
ricorsivamente.
- Eliminare la directory "include" nella vostra directory BUTTAMI (eliminare \
anche tutti i file e sottodirectory di include, ATTENTI A NON ELIMINARE \
l'ORIGINALE /usr/include"
set -v

mkdir BUTTAMI
touch "BUTTAMI/*"
touch "BUTTAMI/**"
touch "BUTTAMI/***"
touch "BUTTAMI/;;"

ls BUTTAMI
for file in BUTTAMI/*; do
	touch "${file}.txt"
done
ls BUTTAMI

cp -r /usr/include BUTTAMI
find BUTTAMI/* -type d

rm -rf BUTTAMI/include

set +v
rm BUTTAMI/*.txt

echo "27) Rifare tutto l'esercizio 26 qui sopra dove però il \"per ciascuno \
dei file nella directory\" viene realizzato usando anche una command \
substitution.
NOTARE CHE IN QUESTO CASO NON SI RIESCE AD ESEGUIRE UN SOLO COMANDO touch \
per ciascuno dei file esistenti. Il problema dipende dalla presenza degli \
asterischi nel nome. MORALE: QUANDO POSSIBILE USARE I METACARATTERI PER \
GENERARE I NOMI DI FILES."
set -v

ls BUTTAMI
for file in `ls BUTTAMI/*`; do
	touch "${file}.txt"
done
ls BUTTAMI
# touch expected to not work properly

set +v
rm -rf BUTTAMI

