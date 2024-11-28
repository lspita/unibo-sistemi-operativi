echo "Realizzare uno script nAnB.sh che prende come argomento una stringa di testo \
e verifica che la stringa sia formata esattamente da N caratteri A seguiti da N \
caratteri B, con un N qualunque maggiore di zero.
Se la stringa corrisponde ai requisiti lo script scrive sullo standard output la \
parola "vero" seguita dal Numero N individuato.
Altrimenti scrive "falso".
Ad esempio, passando come argomento:

AAABBB vedo in output "vero N=3"
ADABBB vedo in output "falso" perché c'è carattere diverso da A e da B
AAB vedo in output "falso"
AabB vedo in output "falso"
"
set -v

chmod +x ./nAnB.sh
./nAnB.sh AAABBB # vero 3
./nAnB.sh ADABBB # falso
./nAnB.sh AAB # falso
./nAnB.sh AabB # falso
./nAnB.sh ABAB # falso
./nAnB.sh B # falso
./nAnB.sh A # falso
./nAnB.sh "" # falso

set +v
