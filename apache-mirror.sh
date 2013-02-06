#!/bin/sh

RSYNC_PROXY=""
export RSYNC_PROXY

prog=/usr/bin/rsync 

basedir=/data/repo/Apache
logdir=$basedir/log
mirror=$basedir/apache-mirror

date=`/bin/date '+%m_%d_%Y-%H:%M:%S'`

logfile=$logdir/log_$date.txt

#site=www.apache.org
site=rsync.us.apache.org

# rsync $site:: > $basedir/apache-mirror-list rsync -rtlzv --delete $site::apache-dist $mirror >$logfile 2>&1

$prog  -avz --delete --safe-links $site::apache-dist $mirror 

