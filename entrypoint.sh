#!/bin/sh -l

time=$(date)
echo "::set-output name=time::$time"


cd /home/cmsusr

set  -e

echo "Setting up $2"
source /opt/cms/cmsset_default.sh
scramv1 project CMSSW $2
cd $2/src
eval `scramv1 runtime -sh`
echo "$2 is at your service."

# This script only dumps the event content of one open data file. Here one could as well have a short cmsRun jon analyzing data.
edmDumpEventContent $1 > dump.txt
sudo chown -R cmsusr /github/workspace
chmod 755 /github/workspace
cp dump.txt /github/workspace

# now the commands are directly in this script and not passeed to image through exec, not sure if good practice
#exec "$@"

echo "::set-output name=output-file-name::dump.txt"
