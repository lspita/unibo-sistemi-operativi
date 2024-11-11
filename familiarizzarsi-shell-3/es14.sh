echo "14. Usare i metacaratteri per visualizzare con ls le proprietà dei \
file contenuti nella directory /usr/lib/ che hanno un nome che contiene la \
stringa plu"
set -v

ls -al /usr/lib/*plu*
# There probably are no files/directories with "plu" in the name inside
# /usr/lib, so we can test with custom files

mkdir tmp
cd tmp
echo "pluto" > pluto.txt
echo "plaplu" > plaplu.txt
mkdir plu
touch plu/abc.txt
touch plu/.hiddenfile
cd ..

ls -al ./tmp/*plu*

set +v 
rm -rf tmp
