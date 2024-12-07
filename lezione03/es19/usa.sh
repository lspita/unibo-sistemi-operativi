if [[ ! -v VAR ]]; then
	echo "VAR is unset"
else
	echo ${VAR}
fi
