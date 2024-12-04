echo "2. Verificare se le variabili USER HOME DISPLAY sono di ambiente o locali"
set -v

env | grep "USER"
env | grep "HOME"
env | grep "DISPLAY"

set +v
