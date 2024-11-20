echo "24. Capire cosa fa il comando wc -c /usr/include/stdio.h"
set -v

# According to man wc
# -c, --bytes: print the byte counts

echo "ciao come va" | wc -c

set +v
