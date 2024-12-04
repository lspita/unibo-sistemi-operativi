START_WD=`pwd`

echo "6. Spostarsi in radice del filesystem e poi stampare a video la propria home directory"
set -v

cd /
echo ${HOME}

set +v
echo "7. Creare nella propria home directory una sottodirectory A1 che contiene una \
sottodirectory C3 che contiene tre file 1.txt 2.txt e 3.txt. Poi usate ul comando move (mv) \
per spostare i 3 file nella directory B2. Poi usate il comando copy (cp) per mettere una copia \
dei tre file nella directory A1"
set -v

cd ${HOME}
mkdir "A1"
cd "A1"
mkdir "B2"
cd "B2"
mkdir "C3"
cd "C3"
touch 1.txt
touch 2.txt
touch 3.txt
mv [1-3].txt ..
cp ../[1-3].txt ../..
cd ${HOME}
ls -aR "A1"

set +v
cd ${HOME}
rm -rf "A1"
cd ${START_WD}
unset START_WD
