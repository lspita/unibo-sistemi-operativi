echo "ESERCIZIO D - Estrazione di colonne:
Premessa: un file CSV è un file di testo in cui ogni riga contiene dei \
campi separati da virgole e che serve per memorizzare delle tabelle.
Ad esempio, se il file contiene questo:

arturo merzario,nato a,Milano,21 dicembre 1950
john remdios dos santo altavilla linares,nato a,Buenos Aires,3 marzo 1933

allora i 4 campi della prima riga sono:
"arturo merzario" "nato a" "Milano" "21 dicembre 1950”
La terza colonna di quel file csv sarà composta dai due campi "Milano" \
e "Buenos Aires”.
Scrivere uno script che prende come argomenti un percorso di un file .csv \
e un indice, e che stampa in output tutti i campi della indice-esima \
colonna di quel file CSV."
set -v

cat test.csv
chmod +x ./estraicolonna.sh

./estraicolonna.sh test.csv 1

./estraicolonna.sh test.csv 2

./estraicolonna.sh test.csv 3

./estraicolonna.sh test.csv 4

set +v
