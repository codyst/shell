#!/bin/sh

RSYNC_PROXY=""
export RSYNC_PROXY

prog=/usr/bin/wget 

basedir=/data/repo/BouncyCastle/
logdir=$basedir/log
mirror=$basedir/bouncycastle-mirror

mkdir $basedir $logdir $mirror 2>/dev/null 

date=`/bin/date '+%m_%d_%Y-%H:%M:%S'`

logfile=$logdir/log_$date.txt

site=http://www.bouncycastle.org/checksums.html
dl=http://www.bouncycastle.org/download

chksum=$mirror/checksums.html

cd $mirror

$prog -N -o $logfile -U mozilla -nH $site

for i in `egrep "\<td\>" $chksum  |  awk -F "td" '{print $2}' | awk -F ">" '{print $2}' | sed -e 's/<\///gm'`
do 
	$prog -N -S -x -nH $dl/$i 2>> $logfile
done




