echo "41. Scrivere uno script reversebizzarro.sh che prende una stringa come unico \
argomento e mette in output la stringa con i caratteri in ordine invertito, il primo \
andrà per ultimo, l'ultimo per primo. Per complicarvi la vita, per implementare \
questo script potete utilizzare solo assegnamenti a variabili, cicli ed if a \
piacere, ed i comandi echo read e cut. Si suppone che la stringa passata come \
argomento non contenga caratteri e metacaratteri interpretati dalla bash."
set -v

chmod +x ./reversebizzarro.sh
./reversebizzarro.sh "ciao come va"

set +v
