echo "Nell'archivio che vi ho messo a disposizione, nella directory BASE_es154, ci \
sono due file esame1.txt ed esame2.txt che contengono ciascuno i risultati di una \
prova pratica di sistemi operativi.
In ciascuna riga dei file c'é il numero di matricola di uno studente presente alla \
prova ed il voto ottenuto in quella prova, separati da spazi bianchi.
La prova pratica, i cui risultati sono nel file esame2.txt, è la prova più recente.
Qualche studente potrebbe essere stato presente solo ad una delle due prove.
Se uno studente è stato presente alla seconda prova allora il risultato della prima \
prova non è più valido e vale solo il voto della seconda.
Implementare uno script voti.sh che legge i due file esame1.txt ed esame2.txt e \
mette in output delle righe; ciascuna riga contiene il voto più recente ottenuto da \
uno studente preceduto dal numero di matricola di quello studente.
Il pratica lo script voti.sh deve mettere in output il voto più recente di ciascuno \
studente, nello stesso formato dei file di input.
Nella directory BASE_es154 c'è un file voti.sh contenente qualche suggerimento.
Se volete potete utilizzare dei file temporanei per salvare risultati parziali, ma \
non è necessario."
set -v

cat esame1.txt

cat esame2.txt

chmod +x ./voti.sh
./voti.sh

set +v
