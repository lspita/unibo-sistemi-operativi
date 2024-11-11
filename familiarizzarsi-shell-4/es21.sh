echo "21. Visualizzare, mediante ls e metacaratteri, tutti i files della \
directory /usr/lib/ il cui nome contiene
- o un carattere numerico compreso tra 1 e 3
- oppure un carattere letterale compreso tra c ed m.
e che termina con l’estensione .0"
set -v

ls -d /usr/lib/*[1-3c-m]*.0 # -d to prevent list matched dirs contents
# There probably are no matching files/dirs in /usr/lib
# Testing on custom dir

mkdir tmp
cd tmp
touch aaa1bbb.txt # no .0 extension
touch aaabbb.0 # no 1-3 or c-m
touch aaa1bbb.0
touch 2bbb.0
touch aaaa3.0
touch abc.0
touch hbb.0
touch amb.0
cd ..

ls -d ./tmp/*[1-3c-m]*.0

set +v
rm -rf tmp

