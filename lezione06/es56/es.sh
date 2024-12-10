echo "56. Scrivere uno script scrivisustderr.sh che legge delle righe passategli \
sullo standard input fino a che non incontra l’EOF. Le righe passate sullo stdin \
devono essere composte da parole separate da spazi. Per ciascuna riga lo script \
usa i comandi di estrazione di stringhe per estrarre la prima parola (separata da \
spazi bianchi) contenuta nella riga. Quella parola estratta deve essere scritta, \
mediante il comando echo, sullo standard error. Per ciascuna parola scritta sullo \
stderr, deve essere scritta la stringa evviva sullo standard output.
Provare poi a passare, come input da tastiera, una riga con un * come prima
parola."
set -v

chmod +x scrivisustderr.sh
./scrivisustderr.sh

set +v
