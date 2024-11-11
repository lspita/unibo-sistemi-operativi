echo "8. Provare a vedere il contenuto di tutti i file nascosti presenti nella propria \
home directory, usando il comando cat. Notare il problema dato dal fatto che .* viene \
espanso anche con .."
set -v

cat .*

set +v