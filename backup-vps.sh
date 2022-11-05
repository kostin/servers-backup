#!/bin/bash

DATE=`date "+%Y-%m-%d"`
BACKUPDIR="/backups/hestia"
SCRIPTDIR="$(dirname "$0")"
source "$SCRIPTDIR/servers.sh"

logadd () {
  echo "$1"
}

mkdir -p ${BACKUPDIR}

for SRV in "${HESTIAS[@]}"
do
  logadd "..."$(date '+%H:%M:%S')" Start working with server ${SRV}"
  rsync -avz root@${SRV}:/backup/ ${BACKUPDIR}/
done
