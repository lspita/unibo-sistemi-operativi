echo "25. Scaricare il file di testo \
http://www.cs.unibo.it/~ghini/didattica/sistemioperativi/ESERCIZI/miofileNoNL.txt \
che ha anche delle righe vuote e che termina con una riga che non ha il \
carattere di andata a capo. Scrivere poi uno script leggitutto.sh che legga riga \
per riga quel file e stampi a video ciascuna riga letta, compresa l'ultima."
set -v

wget -O downloaded.txt \
http://www.cs.unibo.it/~ghini/didattica/sistemioperativi/ESERCIZI/miofileNoNL.txt

chmod +x ./leggitutto.sh
./leggitutto.sh

rm ./downloaded.txt

set +v
