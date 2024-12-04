if [[ $# != 1 ]]; then
	echo "Invalid number of arguments" 1>&2
elif (( $1 <= 1 )); then
	RIS=1
else
	source ./fattoriale1.sh $(($1 - 1))
	RIS=$(($1 * ${RIS}))
fi
