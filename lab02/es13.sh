START_WD=`pwd`

echo "13. Inserire un comando echo, con un messaggio diverso, nei file \
.profile e .bashrc. Poi lanciare una shell interattiva NON di login e \
verificare quale dei due file viene eseguito. \
Poi lanciare una shell NON interattiva e verificare che non viene eseguito \
nessuno dei due file. Poi riportare i file .profile e .bashrc come erano \
all'inizio."
set -v

cd ${HOME}
if [[ -f .bashrc ]]; then
	cp .bashrc .bashrc.backup
fi
if [[ -f .profile ]]; then
	cp .profile .profile.backup
fi

echo "echo bashrc" >> .bashrc
echo "echo profile" >> .profile
read # Press enter to start non-login interactive shell
bash

echo "#!/bin/bash
echo 'hello world'" > testscript.sh
chmod +x testscript.sh
read # Press enter to start non-interactive shell
chmod +x ./testscript.sh 
bash -c ./testscript.sh
rm testscript.sh

mv .bashrc.backup .bashrc
mv .profile.backup .profile

set +v
cd ${START_WD}
unset START_WD
