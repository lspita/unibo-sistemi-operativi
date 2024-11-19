START_WD=`pwd`

echo "6. Spostarsi in radice del filesystem e poi stampare a video la propria home directory"
set -v

cd /
echo ${HOME}

set +v
cd ${START_WD}
unset START_WD