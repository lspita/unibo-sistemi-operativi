echo "37. Scrivere uno script elenco.sh che elenca tutti i file e directory \
presenti nella directory corrente (escludendo dall'elenco la directory corrente, \
la directory superiore e i files nascosti). Per ciascuno di questi file e directory, \
lo script controlla se si tratta di una directory o no. Se si tratta di una \
directory lo script conta la lunghezza del nome della directory e lo accumula in \
una variabile locale LungNomiDirectory. Lo script, inoltre conta i file che non \
sono delle directory. Al termine lo script visualizza in output il numero di file \
di tipo non directory e la lunghezza accumulata dei nomi delle directory lette"
set -v

chmod +x ./elenco.sh

# Creating custom dir for testing
mkdir tmp
cd tmp
touch test1.txt
touch test2.txt
touch .hiddenfile
mkdir testdir1
mkdir dir2
mkdir .hiddendir

../elenco.sh

cd ..
rm -rf tmp

set +v
