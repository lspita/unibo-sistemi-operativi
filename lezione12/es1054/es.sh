echo "Creare un file di testo cadutevic.txt come quello che segue, potete stabilire \
voi quale separatore dei campi usarem ad esempio il TAB:
Ciascuna riga del file contiene 4 campi: l'anno di una caduta, la località della \
caduta il motivo della caduta, i danni riportati.

\"1972\" \"cesena\" \"ribaltamento\" \"leva del freno infilata in una coscia\"
\"1978\" \"cesenatico\" \"manubrio strappato\" \"fianco grattugiato\"
\"1979\" \"cesena\" \"pedale rotto\" \"botta agli zebedei\"
\"1981\" \"san piero\" \"drittone in un campo\" \"naso rotto\"
\"1982\" \"monte cavallo\" \"freni allentati\" \"niente\"
\"1983\" \"monte cavallo\" \"freni allentati\" \"niente\"
\"2007\" \"ciola araldi\" \"ribaltamento\" \"incisivo perso\"
\"2010\" \"monte cavallo\" \"ghiaccio\" \"niente\"

Notare che i singoli campi sono delimitati (prima e dopo) da un doppio apice \" che fa parte del
campo stesso.
Quindi la stringa \"freno infilato in una coscia\" viene considerato come un unico campo.
Realizzare uno script bash che scrive sullo standard output solo il TERZO campo di \
ciascuna riga del file cadutevic.txt"
set -v

cat cadutevic.txt

chmod +x ./stringhe_confinate.sh
./stringhe_confinate.sh

set +v
