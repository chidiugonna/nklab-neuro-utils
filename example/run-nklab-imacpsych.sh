#!/bin/bash
dockerimg=orbisys/nklab-neuro-utils
workdir=$PWD
mountworkdir=/opt/data

dicomdir=${mountworkdir}/unencrypted
stagedir=${mountworkdir}/stagedbids
bidsdir=${mountworkdir}/hippDATA

sessions="--sessions pre post"
logname="--logname bidconvert-CORT-log"
translator="--bidstranslator ${mountworkdir}/Protocol_Translator.json"
exception="--exceptionlist ${mountworkdir}/exception.json"

#docker example
docker run --rm -v ${workdir}:${mountworkdir} $dockerimg python3 -u /opt/bin/nklab-bids-convert.py $dicomdir $stagedir $bidsdir $sessions --workdir $mountworkdir $logname --noprompt --bypass --incremental $translator $exception

#singularity example
dockerimg=/home/chidi/singularity-images/nklab-neuro-utils.simg
singularity run -B ${workdir}:${mountworkdir} $singimg python3 -u /opt/bin/nklab-bids-convert.py $dicomdir $stagedir $bidsdir $sessions --workdir $mountworkdir $logname --noprompt --bypass --incremental $translator $exception


#python example
#
# remember to change mountworkdir from /opt/data to its more likely value
#
python3 -u /opt/bin/nklab-bids-convert.py $dicomdir $stagedir $bidsdir $sessions --workdir $mountworkdir $logname --noprompt --bypass --incremental $translator $exception
