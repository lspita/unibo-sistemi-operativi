echo "20. Stampare a video le sole righe del file /usr/include/stdio.h che \
contengono almeno un asterisco *
Suggerimento 1: utilizzare il comando grep ma senza usare l'operatore |
Suggerimento 2: Guardare il man di grep per capire come usare grep in modo \
opportuno."
set -v

# Suggerimento 1
grep "*" /usr/include/stdio.h

# Suggerimento 2
cat /usr/include/stdio.h | grep "*" -

set +v
echo "21. Stampare a video le sole righe del file /usr/include/stdio.h che NON \
contengono alcun asterisco *
Suggerimento 2: Guardare il man di grep per capire come usare grep in modo opportuno."
set -v

cat /usr/include/stdio.h | grep -v "*" -

set +v
