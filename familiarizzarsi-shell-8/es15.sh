START_WD=`pwd`
echo "15. Scrivere uno script bash triplette.sh che stampa a video tutte le triplette \
di forma (X;Y;Z) dove X Y e Z sono i nomi dei file, non nascosti, nella directory corrente."
set -v

# Creating custom dir
mkdir tmp
cd tmp
touch file1.txt
touch file2.txt
touch file3.txt
touch .hiddenfile
mkdir dir1
mkdir .hiddendir
ls -alh

chmod +x ../triplette.sh
../triplette.sh

set +v
cd ${START_WD}
rm -rf tmp
