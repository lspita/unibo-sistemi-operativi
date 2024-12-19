echo "ESERCIZIO B - Copia ricorsiva con filtro:
Scrivi uno script che copia tutti i file con estensione .txt da una \
directory di origine a una directory di destinazione, entrambe \
specificate mediante un argomento a riga di comando. Lo script deve \
ignorare i file vuoti"
set -v

mkdir dst
mkdir src

touch src/empty1.txt
touch src/empty1.c
echo "Hello 1 txt" > src/test1.txt
echo "Hello 1 sh" > src/test1.sh
echo "Hidden 1 txt" > src/.hidden1.txt
echo "Hidden 1 py" > src/.hidden1.py

mkdir src/subdir
touch src/subdir/empty2.txt
touch src/subdir/empty2.c
echo "Hello 2 txt" > src/subdir/test2.txt
echo "Hello 2 sh" > src/subdir/test2.sh
echo "Hidden 2 txt" > src/subdir/.hidden2.txt
echo "Hidden 2 py" > src/subdir/.hidden2.py

ls -1AR src

chmod +x ./copiatesti.sh
./copiatesti.sh src dst

ls -1AR dst

rm -rf src dst

set +v
