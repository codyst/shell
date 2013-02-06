#!/bin/sh

RSYNC_PROXY=""
export RSYNC_PROXY

prog=/usr/bin/wget 

basedir=/data/repo/Sun/NetBeans
logdir=$basedir/log
mirror=$basedir/netbeans-mirror

mkdir $basedir $logdir $mirror 2>/dev/null 

date=`/bin/date '+%m_%d_%Y-%H:%M:%S'`

logfile=$logdir/log_$date.txt

site=http://dlc.sun.com.edgesuite.net/netbeans/updates

version=(6.7.1 6.8 6.9 7.0 7.0.1 7.1 7.1.1 7.1.2 7.2 7.3)

cd $mirror

for version in ${version[@]} 
do
echo $version

$prog -r -l 0 -np -N -S -x -nH -U mozilla $site/$version >> $logfile
 
done


