echo "Creare un file di testo cadutevic.txt come quello che segue:
1972 cesena ribaltamento leva_del_freno_infilata_in_una_coscia
1978 cesenatico manubrio_strappato fianco_grattugiato
1979 cesena pedale_rotto botta_agli_zebedei
1981 san_piero drittone_in_un_campo naso_rotto
1982 monte_cavallo freni_allentati contusioni
1983 monte_cavallo freni_allentati contusioni
2007 ciola_araldi ribaltamento incisivo_perso
2010 monte_cavallo ghiaccio niente

Ciascuna riga del file contiene 4 campi: l'anno di una caduta, la località della \
caduta, il motivo della caduta, i danni riportati.
Notare che quando un campo è formato da più di una parola le parole sono unite da \
un carattere underscore _ Ad esempio incisivo_perso
Notare che nessun campo motivo è una sottostringa di qualche altro campo motivo.
Realizzare uno script bash che emette sullo standard output alcune righe. In \
ciascuna riga compare un motivo della caduta e il numero delle volte che quella \
motivo è accaduto.
Potrebbe essere utile usare qualche file temporaneo in cui salvare informazioni \
parziali.
Per evitare ripetizioni di righe in output si può usare un comando uniq che \
permette di eliminare le righe ripetute di un file. Usare il man per capire \
come funziona."
set -v

cat cadutevic.txt

chmod +x ./raggruppa.sh
./raggruppa.sh

set +v
