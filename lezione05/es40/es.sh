echo "40. Verificare se il seguente comando va a buon fine oppure produce errori \
ed in questo ultimo caso capire quale è il problema.
for (( i=0; ls ./ ; i=i+1 )) ; do echo "${i}" ; done"
set -v

for (( i=0; ls ./ ; i=i+1 )) ; do echo "${i}" ; done

# bash: ((: ls ./ : syntax error: invalid arithmetic operator (error token is "./ ")
#
# ls ./ is not an arithmetic operation but it is used inside an arithmetic condition
# if you want to loop i for the number of files and directoriess in the current
# directory, you could do

i=0
for x in `ls ./`; do echo "${i}"; ((i=i+1)); done

set +v
